import 'dart:convert';

import 'package:http/http.dart';

import '../Model_Class/Login_model.dart';
import 'api_client.dart';


class LogInApi {
  ApiClient apiClient = ApiClient();


  Future<LogInModel> getLogin(String phoneNumber) async {
    String trendingpath = 'http://178.18.254.224:8654/api/customer/login';
    var body = {
      "phoneNumber":phoneNumber
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return LogInModel.fromJson(jsonDecode(response.body));
  }
}