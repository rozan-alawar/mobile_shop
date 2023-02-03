import 'package:mobile_shop/src/data/models/products.dart';

class CategoryDetailsResponse {
  bool? status;
  String? message;
  Data? data;

  CategoryDetailsResponse({this.status, this.message, this.data});

  CategoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<Product>? product;

  Data({
    this.product,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['data'] = product!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
