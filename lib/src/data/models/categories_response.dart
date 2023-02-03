import 'package:mobile_shop/src/data/models/category.dart';

class CategoriesResponse {
  bool? status;
  String? message;
  Categories? categories;

  CategoriesResponse({this.status, this.message, this.categories});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    categories =
        json['data'] != null ? Categories.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (categories != null) {
      data['data'] = categories!.toJson();
    }
    return data;
  }
}

class Categories {
  List<Category>? categories;

  int? total;

  Categories({this.categories, this.total});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categories = <Category>[];
      json['data'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }

    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }

    data['total'] = total;
    return data;
  }
}
