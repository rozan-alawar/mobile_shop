import 'package:mobile_shop/src/data/models/products.dart';

class FavoriteRsponse {
  bool? status;
  String? message;
  Data? data;

  FavoriteRsponse({this.status, this.message, this.data});

  FavoriteRsponse.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<FavItems>? items;

  int? total;

  Data({this.currentPage, this.items, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      items = <FavItems>[];
      json['data'].forEach((v) {
        items!.add(FavItems.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (items != null) {
      data['data'] = items!.map((v) => toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class FavItems {
  int? id;
  Product? product;

  FavItems({this.id, this.product});

  FavItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
