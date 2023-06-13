class LoginModel {
  String? message;
  bool? status;
  UserData? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = UserData.fromJson(json['data']);
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  int? points;
  int? credit;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    credit = json['credit'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    points = json['points'];
    image = json['image'];
  }
}
