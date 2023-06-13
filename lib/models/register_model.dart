class RegisterModel {
  bool status = false;
  String message = '';
  UserModel? data;

  RegisterModel({required this.status, required this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.id,
      required this.image,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['id'] = id;
    data['image'] = image;
    data['token'] = token;
    return data;
  }
}
