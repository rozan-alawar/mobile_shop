import 'package:mobile_shop/src/data/models/products.dart';

class AddToCartResponse {
  bool? status;
  String? message;
  Product? data;

  AddToCartResponse({this.status, this.message, this.data});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
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
