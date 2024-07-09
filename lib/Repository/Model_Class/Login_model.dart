
class LogInModel {
  Facility? facility;
  String? accessToken;

  LogInModel({this.facility, this.accessToken});

  LogInModel.fromJson(Map<String, dynamic> json) {
    facility = json["facility"] == null ? null : Facility.fromJson(json["facility"]);
    accessToken = json["accessToken"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(facility != null) {
      _data["facility"] = facility?.toJson();
    }
    _data["accessToken"] = accessToken;
    return _data;
  }
}

class Facility {
  RushHours? rushHours;
  List<dynamic>? accessDevices;
  List<dynamic>? category;
  String? id;
  String? tier;
  List<String>? gender;
  String? facilityName;
  String? contactPerson;
  String? facilityType;
  String? emailAddress;
  String? phoneNumber;
  String? websiteUrl;
  String? logoUrl;
  String? description;
  List<String>? images;
  String? address;
  int? pinCode;
  String? country;
  String? state;
  String? latitudeLongitude;
  List<Amenities>? amenities;
  List<FacilityTiming>? facilityTiming;
  int? admissionFee;
  int? dailyPass;
  dynamic monthlyPass;
  dynamic threeMonthPass;
  dynamic sixMonthPass;
  dynamic annualPass;
  String? other;
  List<dynamic>? review;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? link;
  bool? isEnable;
  List<dynamic>? paymentInfo;

  Facility({this.rushHours, this.accessDevices, this.category, this.id, this.tier, this.gender, this.facilityName, this.contactPerson, this.facilityType, this.emailAddress, this.phoneNumber, this.websiteUrl, this.logoUrl, this.description, this.images, this.address, this.pinCode, this.country, this.state, this.latitudeLongitude, this.amenities, this.facilityTiming, this.admissionFee, this.dailyPass, this.monthlyPass, this.threeMonthPass, this.sixMonthPass, this.annualPass, this.other, this.review, this.createdAt, this.updatedAt, this.v, this.link, this.isEnable, this.paymentInfo});

  Facility.fromJson(Map<String, dynamic> json) {
    rushHours = json["rushHours"] == null ? null : RushHours.fromJson(json["rushHours"]);
    accessDevices = json["access_devices"] ?? [];
    category = json["category"] ?? [];
    id = json["_id"];
    tier = json["tier"];
    gender = json["gender"] == null ? null : List<String>.from(json["gender"]);
    facilityName = json["facilityName"];
    contactPerson = json["contactPerson"];
    facilityType = json["facility_type"];
    emailAddress = json["emailAddress"];
    phoneNumber = json["phoneNumber"];
    websiteUrl = json["websiteURL"];
    logoUrl = json["logoUrl"];
    description = json["description"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    address = json["address"];
    pinCode = json["pin_code"];
    country = json["country"];
    state = json["state"];
    latitudeLongitude = json["latitude_longitude"];
    amenities = json["amenities"] == null ? null : (json["amenities"] as List).map((e) => Amenities.fromJson(e)).toList();
    facilityTiming = json["facilityTiming"] == null ? null : (json["facilityTiming"] as List).map((e) => FacilityTiming.fromJson(e)).toList();
    admissionFee = json["admission_fee"];
    dailyPass = json["daily_pass"];
    monthlyPass = json["monthly_pass"];
    threeMonthPass = json["threeMonth_pass"];
    sixMonthPass = json["sixMonth_pass"];
    annualPass = json["annual_pass"];
    other = json["other"];
    review = json["review"] ?? [];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    link = json["link"];
    isEnable = json["isEnable"];
    paymentInfo = json["paymentInfo"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(rushHours != null) {
      _data["rushHours"] = rushHours?.toJson();
    }
    if(accessDevices != null) {
      _data["access_devices"] = accessDevices;
    }
    if(category != null) {
      _data["category"] = category;
    }
    _data["_id"] = id;
    _data["tier"] = tier;
    if(gender != null) {
      _data["gender"] = gender;
    }
    _data["facilityName"] = facilityName;
    _data["contactPerson"] = contactPerson;
    _data["facility_type"] = facilityType;
    _data["emailAddress"] = emailAddress;
    _data["phoneNumber"] = phoneNumber;
    _data["websiteURL"] = websiteUrl;
    _data["logoUrl"] = logoUrl;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images;
    }
    _data["address"] = address;
    _data["pin_code"] = pinCode;
    _data["country"] = country;
    _data["state"] = state;
    _data["latitude_longitude"] = latitudeLongitude;
    if(amenities != null) {
      _data["amenities"] = amenities?.map((e) => e.toJson()).toList();
    }
    if(facilityTiming != null) {
      _data["facilityTiming"] = facilityTiming?.map((e) => e.toJson()).toList();
    }
    _data["admission_fee"] = admissionFee;
    _data["daily_pass"] = dailyPass;
    _data["monthly_pass"] = monthlyPass;
    _data["threeMonth_pass"] = threeMonthPass;
    _data["sixMonth_pass"] = sixMonthPass;
    _data["annual_pass"] = annualPass;
    _data["other"] = other;
    if(review != null) {
      _data["review"] = review;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["link"] = link;
    _data["isEnable"] = isEnable;
    if(paymentInfo != null) {
      _data["paymentInfo"] = paymentInfo;
    }
    return _data;
  }
}

class FacilityTiming {
  Morning1? morning;
  Evening1? evening;
  String? day;
  String? id;

  FacilityTiming({this.morning, this.evening, this.day, this.id});

  FacilityTiming.fromJson(Map<String, dynamic> json) {
    morning = json["morning"] == null ? null : Morning1.fromJson(json["morning"]);
    evening = json["evening"] == null ? null : Evening1.fromJson(json["evening"]);
    day = json["day"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(morning != null) {
      _data["morning"] = morning?.toJson();
    }
    if(evening != null) {
      _data["evening"] = evening?.toJson();
    }
    _data["day"] = day;
    _data["_id"] = id;
    return _data;
  }
}

class Evening1 {
  String? start;
  String? end;
  bool? holiday;

  Evening1({this.start, this.end, this.holiday});

  Evening1.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
    holiday = json["holiday"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["end"] = end;
    _data["holiday"] = holiday;
    return _data;
  }
}

class Morning1 {
  String? start;
  String? end;
  bool? holiday;

  Morning1({this.start, this.end, this.holiday});

  Morning1.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
    holiday = json["holiday"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["end"] = end;
    _data["holiday"] = holiday;
    return _data;
  }
}

class Amenities {
  String? amenitiesName;
  String? isPaid;
  String? iconUrl;
  String? id;

  Amenities({this.amenitiesName, this.isPaid, this.iconUrl, this.id});

  Amenities.fromJson(Map<String, dynamic> json) {
    amenitiesName = json["amenities_name"];
    isPaid = json["isPaid"];
    iconUrl = json["iconUrl"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["amenities_name"] = amenitiesName;
    _data["isPaid"] = isPaid;
    _data["iconUrl"] = iconUrl;
    _data["_id"] = id;
    return _data;
  }
}

class RushHours {
  Morning? morning;
  Evening? evening;

  RushHours({this.morning, this.evening});

  RushHours.fromJson(Map<String, dynamic> json) {
    morning = json["morning"] == null ? null : Morning.fromJson(json["morning"]);
    evening = json["evening"] == null ? null : Evening.fromJson(json["evening"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(morning != null) {
      _data["morning"] = morning?.toJson();
    }
    if(evening != null) {
      _data["evening"] = evening?.toJson();
    }
    return _data;
  }
}

class Evening {
  String? start;
  String? end;

  Evening({this.start, this.end});

  Evening.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["end"] = end;
    return _data;
  }
}

class Morning {
  String? start;
  String? end;

  Morning({this.start, this.end});

  Morning.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["end"] = end;
    return _data;
  }
}