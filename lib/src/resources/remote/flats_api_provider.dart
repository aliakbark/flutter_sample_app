import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/models/flats/flats_list_res.dart';
import 'package:flutter_sample_app/src/models/response_state.dart';

/// api response status code is  checking here, ie  request is  successful or not
/// if the  api response is successful, then return data else return null
class FlatsApiProvider {
  Future<ResponseState> flatsList() async {
    final response = await ObjectFactory().apiService.flatsList();

    if (response.statusCode == 200) {
      return ResponseState<FlatsResponse>.success(
          FlatsResponse.fromJson(response.data));
    } else {
      return ResponseState<dynamic>.error(
          FlatsResponse.fromJson(response.data).message);
    }
  }
}
