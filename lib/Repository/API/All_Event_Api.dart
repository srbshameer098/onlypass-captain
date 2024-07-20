import 'dart:convert';

import 'package:http/http.dart';

import '../Model_Class/All_Event_Model.dart';
import 'api_client.dart';




class AllEventApi {
  ApiClient apiClient = ApiClient();

  Future<List<AllEventModel>> getAllEvent() async {
    String path = 'http://192.168.1.19:5000/api/event';
    var body = {};

    Response response= await apiClient.invokeAPI(path, 'GET', body);
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<Map<String, dynamic>> AllEventList = jsonResponse.cast<Map<String, dynamic>>();
    return AllEventModel.fromList(AllEventList);
  }
}