
class LogInModel {
  String? facilityId;
  bool? facilityCode;
  String? acsToken;
  String? customerId;
  bool? customerCode;

  LogInModel({this.facilityId, this.facilityCode, this.acsToken, this.customerId, this.customerCode});

  LogInModel.fromJson(Map<String, dynamic> json) {
    facilityId = json["facilityId"];
    facilityCode = json["facilityCode"];
    acsToken = json["acsToken"];
    customerId = json["customerId"];
    customerCode = json["customerCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["facilityId"] = facilityId;
    _data["facilityCode"] = facilityCode;
    _data["acsToken"] = acsToken;
    _data["customerId"] = customerId;
    _data["customerCode"] = customerCode;
    return _data;
  }
}