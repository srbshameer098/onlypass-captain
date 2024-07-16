import 'dart:convert';

import 'package:http/http.dart';

import '../Model_Class/Login_model.dart';
import 'api_client.dart';


class LogInApi {
  ApiClient apiClient = ApiClient();


  Future<LogInModel> getLogin(String phoneNumber) async {
    String trendingpath = 'http://192.168.1.37:5000/api/captian-app/for-login';
    var body = {
      "phoneNumber":phoneNumber
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return LogInModel.fromJson(jsonDecode(response.body));
  }
}