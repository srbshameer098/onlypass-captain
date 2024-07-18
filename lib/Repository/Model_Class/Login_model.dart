
class LogInModel {
  String? facilityId;
  String? facilityCode;
  String? acsToken;
  String? customerCode;

  LogInModel({this.facilityId, this.facilityCode, this.acsToken, this.customerCode});

  LogInModel.fromJson(Map<String, dynamic> json) {
    if(json["facilityId"] is String) {
      facilityId = json["facilityId"];
    }
    if(json["facilityCode"] is String) {
      facilityCode = json["facilityCode"];
    }
    if(json["acsToken"] is String) {
      acsToken = json["acsToken"];
    }
    if(json["customerCode"] is String) {
      customerCode = json["customerCode"];
    }
  }

  static List<LogInModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LogInModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["facilityId"] = facilityId;
    _data["facilityCode"] = facilityCode;
    _data["acsToken"] = acsToken;
    _data["customerCode"] = customerCode;
    return _data;
  }
}