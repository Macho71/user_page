import 'package:dio/dio.dart';
import 'package:user1/core/socses.dart';
import 'package:user1/model/port_model.dart';

class PostService {
  static Future<ResponseHandler> getPost() async {
    try {
      Response response = await Dio().get(
        "http://192.168.1.3:4000/home",
      );
      if (response.statusCode == 201) {
        return SuccsesResponse(
            (response.data as List).map((e) => PostModel.fromJson(e)).toList());
      } else {
        return ErrorResponse(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return ExcaptionResponse(e);
    }
  }
}
