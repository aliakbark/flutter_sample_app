import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/src/blocs/home_bloc.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';
import 'package:flutter_sample_app/src/models/flats/flats_list_res.dart'
    as flats_res;
import 'package:flutter_sample_app/src/utilities/utils.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.fetchFlats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  snap: true,
                  forceElevated: true,
                  title: Text(
                    'Flutter sample App',
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.exit_to_app),
                        onPressed: () {
                          Utils.logoutAction(context);
                        })
                  ],
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: StreamBuilder<List<flats_res.Datum>>(
                  stream: _homeBloc.flatsList,
                  initialData: [],
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                    if (snapshot.hasData && snapshot.data.length == 0) {
                      return Center(
                        child: Text('No flats!'),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(
                              snapshot.data[index].title,
                            ),
                            subtitle: Text(
                                'Rent: ${snapshot.data[index].monthlyRent}'),
                          ),
                        );
                      },
                    );
                  }),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _homeBloc.fetchFlats();
          }),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
