class EventModel {
  EventModel({
      this.name, 
      this.facility, 
      this.description, 
      this.image, 
      this.eventLeader, 
      this.startDate, 
      this.endDate, 
      this.fee, 
      this.amount, 
      this.availableSlot, 
      this.repeatEndDate, 
      this.repetDays, 
      this.eventAddress, 
      this.eventLatLong, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  EventModel.fromJson(dynamic json) {
    name = json['name'];
    facility = json['facility'];
    description = json['description'];
    image = json['image'];
    eventLeader = json['eventLeader'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    fee = json['fee'];
    amount = json['amount'];
    availableSlot = json['availableSlot'];
    repeatEndDate = json['repeatEndDate'];
    repetDays = json['repetDays'] != null ? json['repetDays'].cast<String>() : [];
    eventAddress = json['eventAddress'];
    eventLatLong = json['eventLat_Long'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
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
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['facility'] = facility;
    map['description'] = description;
    map['image'] = image;
    map['eventLeader'] = eventLeader;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['fee'] = fee;
    map['amount'] = amount;
    map['availableSlot'] = availableSlot;
    map['repeatEndDate'] = repeatEndDate;
    map['repetDays'] = repetDays;
    map['eventAddress'] = eventAddress;
    map['eventLat_Long'] = eventLatLong;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}