import 'package:flutter_sample_app/src/blocs/base_bloc.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/models/flats/flats_list_res.dart'
    as flats_res;
import 'package:flutter_sample_app/src/models/response_state.dart';
import 'package:flutter_sample_app/src/utilities/validators.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Object with Validators implements BaseBloc {
  final _screenStatus = BehaviorSubject<ScreenStatus>();
  final _flats = BehaviorSubject<List<flats_res.Datum>>();

  Stream<List<flats_res.Datum>> get flatsList => _flats.stream;

  void fetchFlats() async {
    changeScreenStatus(ScreenStatus.loading);
    ResponseState state = await ObjectFactory().repository.flatsList();
    changeScreenStatus(ScreenStatus.ready);
    if (state is SuccessResponseState) {
      _flats.sink.add(state.value.data);
    } else if (state is ErrorResponseState) {
      _flats.sink.addError('${state.msg}');
    }
  }

  @override
  Function(ScreenStatus) get changeScreenStatus => _screenStatus.sink.add;

  @override
  ScreenStatus get getScreenStatus => _screenStatus.value;

  @override
  Stream<ScreenStatus> get screenStatus => _screenStatus.stream;

  @override
  void dispose() async {
    await _screenStatus.drain();
    _screenStatus.close();
    await _flats.drain();
    _flats.close();
  }
}
