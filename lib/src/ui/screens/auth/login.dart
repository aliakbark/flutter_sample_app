import 'package:flutter/material.dart';
import 'package:flutter_sample_app/src/blocs/auth_bloc.dart';
import 'package:flutter_sample_app/src/blocs/base_bloc.dart';
import 'package:flutter_sample_app/src/utilities/constants.dart';
import 'package:flutter_sample_app/src/utilities/ui_helpers.dart';
import 'package:flutter_sample_app/src/utilities/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthBloc _bloc = AuthBloc();
  FocusNode _usernameFN = FocusNode();
  FocusNode _passwordFN = FocusNode();

  String dialCode = '';

  bool enableForm = true;

  @override
  void initState() {
    super.initState();
    _listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<ScreenStatus>(
          stream: _bloc.screenStatus,
          initialData: ScreenStatus.ready,
          builder: (context, screenStatus) {
            enableForm = !(screenStatus.data == ScreenStatus.loading);
            return Container(
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpaceTiny,
                      Text(
                        'Enter your username and password to proceed.',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      verticalSpaceSmall,
                      _usernameInputField(),
                      verticalSpaceSmall,
                      _passwordInputField(),
                      ButtonBar(
                        layoutBehavior: ButtonBarLayoutBehavior.padded,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      )
                    ],
                  ),
                  _getSubmitButton(screenStatus: screenStatus.data),
                ],
              ),
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  /// Besides the user entering their phone number, we also need to know the user's country code
  /// for that we are gonna use a library CountryCodePicker.
  /// The method takes in an [error] message from our validator.
  Widget _usernameInputField() {
    return StreamBuilder(
        stream: _bloc.username,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              focusNode: _usernameFN,
              textAlign: TextAlign.start,
              controller: _phoneController,
              enabled: enableForm,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: Constants.enterUsername,
                errorText: snapshot.error,
              ),
              onChanged: _bloc.changeUsername,
              onSubmitted: (text) {
//                if (text.length == 10) _verifyPhoneNumber();
              },
            ),
          );
        });
  }

  _passwordInputField() {
    return StreamBuilder<String>(
        stream: _bloc.password,
        builder: (context, snapshot) {
          return TextField(
            focusNode: _passwordFN,
            textAlign: TextAlign.start,
            controller: _passwordController,
            enabled: enableForm,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: Constants.enterPassword,
              errorText: snapshot.error,
            ),
            onChanged: _bloc.changePassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (text) {},
          );
        });
  }

  _getSubmitButton({ScreenStatus screenStatus}) {
    return StreamBuilder<bool>(
        stream: _bloc.submitCheckLogin,
        builder: (context, snapshot) {
          return RaisedButton(
              color: snapshot.hasData
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              child: screenStatus == ScreenStatus.loading
                  ? CircularProgressIndicator()
                  : Text('LOGIN'),
              onPressed: () =>
                  snapshot.hasData && screenStatus != ScreenStatus.loading
                      ? _bloc.loginUsingPassword(
                          username: '${_bloc.getUsername}',
                          password: _bloc.getPassword)
                      : null);
        });
  }

  _navHome({@required String username, @required String token}) {
    Utils.loginAction(context, username, token);
  }

  void _listeners() {
    ///Password login
    _bloc.passwordLogin.listen((res) {
      if (res.token != null && res.token.isNotEmpty) {
        Fluttertoast.showToast(
          msg: '${res.message}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
        _navHome(username: _bloc.getUsername, token: res.token);
      }
    }, onError: (error) {
      Fluttertoast.showToast(
        msg: '$error',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    });
  }
}
