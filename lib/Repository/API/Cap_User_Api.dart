import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart';


import '../Model_Class/Cap_User_Model.dart';
import 'api_client.dart';




class UserApi {
  ApiClient apiClient = ApiClient();
  Future<CapUser> getUser(
      {
        required String userName,
        required String phoneNumber,
        required String gender,
        required String email,
        required String userRole,
        required String facilityId,


      }) async {
    String trendingpath = 'http://192.168.1.19:5000/api/captian-app/cap-user-create';
    var body = {
      "userName":"Anas",
      "phoneNumber":"7435348344",
      "gender":"Male",
      "email":"testemail@gmail.com",
      "userRole":"Posing trainer",
      "facilityId":"6628adbce28c1e21e5cde4ba"
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));
    return CapUser.fromJson(jsonDecode(response.body));
  }
}