import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model_Class/Event_model.dart';
import 'api_client.dart';

class EventApi {
  ApiClient apiClient = ApiClient();

  Future<EventModel> getEvent(
     String name,
     String facility,
     String description,
     String image,
     String eventLeader,
     String startDate,
     String endDate,
     bool fee,
     String amount,
     String availableSlot,
     String repeatEndDate,
     List<String> repetDays,
     String eventAddress,
     String eventLat_Long,
     String id,
     String createdAt,
     String updatedAt,
     String v,
  ) async {

    String trendingpath = 'http://178.18.254.224:8654/api/event/create';
    var body = {
      "name": name,
      "facility": facility,
      "description": description,
      "image": image,
      "eventLeader": eventLeader,
      "startDate": startDate,
      "endDate": endDate,
      "fee": fee,
      "amount": amount,
      "availableSlot": availableSlot,
      "repeatEndDate": repeatEndDate,
      // "repetDays": ["Monday", "Tuesday", "Wednesday"],
      "repetDays": [repetDays],
      "eventAddress": eventAddress,
      "eventLat_Long": eventLat_Long,
      "_id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": v
    };
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));
    return EventModel.fromJson(jsonDecode(response.body));
  }
}
