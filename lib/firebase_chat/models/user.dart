class User {
  String? uid;
  String? name;
  String? avatar;

  User({
    required this.uid,
    required this.name,
    required this.avatar,
  });

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    data['uid'] = uid;
    return data;
  }
}
