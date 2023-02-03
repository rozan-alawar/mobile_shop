import 'package:mobile_shop/src/data/models/products.dart';

class ProductDetailsModel {
  bool? status;
  String? message;
  Product? product;
  ProductDetailsModel({this.product, this.message, this.status});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> map) {
    return ProductDetailsModel(
      message: map['message'],
      status: map['status'],
      product: Product.fromJson(
        map['data'],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': product!.toJson(),
    };
  }
}
