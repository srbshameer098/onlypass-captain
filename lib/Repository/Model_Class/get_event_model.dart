
class GetEventModel {
  String? id;
  String? name;
  String? facility;
  String? description;
  String? image;
  String? eventLeader;
  String? startDate;
  String? endDate;
  bool? fee;
  int? amount;
  int? availableSlot;
  String? repeatEndDate;
  List<String>? repetDays;
  String? eventAddress;
  String? eventLatLong;
  String? createdAt;
  String? updatedAt;
  int? v;

  GetEventModel({this.id, this.name, this.facility, this.description, this.image, this.eventLeader, this.startDate, this.endDate, this.fee, this.amount, this.availableSlot, this.repeatEndDate, this.repetDays, this.eventAddress, this.eventLatLong, this.createdAt, this.updatedAt, this.v});

  GetEventModel.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["facility"] is String) {
      facility = json["facility"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["eventLeader"] is String) {
      eventLeader = json["eventLeader"];
    }
    if(json["startDate"] is String) {
      startDate = json["startDate"];
    }
    if(json["endDate"] is String) {
      endDate = json["endDate"];
    }
    if(json["fee"] is bool) {
      fee = json["fee"];
    }
    if(json["amount"] is num) {
      amount = (json["amount"] as num).toInt();
    }
    if(json["availableSlot"] is num) {
      availableSlot = (json["availableSlot"] as num).toInt();
    }
    if(json["repeatEndDate"] is String) {
      repeatEndDate = json["repeatEndDate"];
    }
    if(json["repetDays"] is List) {
      repetDays = json["repetDays"] == null ? null : List<String>.from(json["repetDays"]);
    }
    if(json["eventAddress"] is String) {
      eventAddress = json["eventAddress"];
    }
    if(json["eventLat_Long"] is String) {
      eventLatLong = json["eventLat_Long"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is num) {
      v = (json["__v"] as num).toInt();
    }
  }

  static List<GetEventModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => GetEventModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["facility"] = facility;
    _data["description"] = description;
    _data["image"] = image;
    _data["eventLeader"] = eventLeader;
    _data["startDate"] = startDate;
    _data["endDate"] = endDate;
    _data["fee"] = fee;
    _data["amount"] = amount;
    _data["availableSlot"] = availableSlot;
    _data["repeatEndDate"] = repeatEndDate;
    if(repetDays != null) {
      _data["repetDays"] = repetDays;
    }
    _data["eventAddress"] = eventAddress;
    _data["eventLat_Long"] = eventLatLong;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }

  GetEventModel copyWith({
    String? id,
    String? name,
    String? facility,
    String? description,
    String? image,
    String? eventLeader,
    String? startDate,
    String? endDate,
    bool? fee,
    int? amount,
    int? availableSlot,
    String? repeatEndDate,
    List<String>? repetDays,
    String? eventAddress,
    String? eventLatLong,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) => GetEventModel(
    id: id ?? this.id,
    name: name ?? this.name,
    facility: facility ?? this.facility,
    description: description ?? this.description,
    image: image ?? this.image,
    eventLeader: eventLeader ?? this.eventLeader,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    fee: fee ?? this.fee,
    amount: amount ?? this.amount,
    availableSlot: availableSlot ?? this.availableSlot,
    repeatEndDate: repeatEndDate ?? this.repeatEndDate,
    repetDays: repetDays ?? this.repetDays,
    eventAddress: eventAddress ?? this.eventAddress,
    eventLatLong: eventLatLong ?? this.eventLatLong,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );
}