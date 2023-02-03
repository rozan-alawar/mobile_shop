import 'package:mobile_shop/src/data/models/user.dart';

class APIResponse {
  bool? status;
  String? message;
  User? data;

  APIResponse({this.status, this.message, this.data});

  APIResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
