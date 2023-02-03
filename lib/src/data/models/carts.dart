import 'package:mobile_shop/src/data/models/products.dart';

class CartsResponse {
  bool? status;
  String? message;
  Carts? carts;

  CartsResponse({this.status, this.message, this.carts});

  CartsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    carts = json['data'] != null ? Carts.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (carts != null) {
      data['data'] = carts!.toJson();
    }
    return data;
  }
}

class Carts {
  List<CartItems>? cartItems;
  num? subTotal;
  num? total;

  Carts({this.cartItems, this.subTotal, this.total});

  Carts.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = subTotal;
    data['total'] = total;
    return data;
  }
}

class CartItems {
  int? id;
  int? quantity;
  Product? product;

  CartItems({this.id, this.quantity, this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
