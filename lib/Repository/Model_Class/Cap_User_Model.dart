
class CapUser {
  String? msg;

  CapUser({this.msg});

  CapUser.fromJson(Map<String, dynamic> json) {
    if(json["msg"] is String) {
      msg = json["msg"];
    }
  }

  static List<CapUser> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CapUser.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["msg"] = msg;
    return _data;
  }
}