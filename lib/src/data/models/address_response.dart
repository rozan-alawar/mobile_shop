class AddressResponse {
  bool? status;
  String? message;
  Addresses? addresses;

  AddressResponse({this.status, this.message, this.addresses});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    addresses = json['data'] != null ? Addresses.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (addresses != null) {
      data['data'] = addresses!.toJson();
    }
    return data;
  }
}

class Addresses {
  List<Address>? data;

  Addresses({this.data});

  Addresses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Address>[];
      json['data'].forEach((v) {
        data!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  Address(
      {this.id,
      this.name,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city'] = city;
    data['region'] = region;
    data['details'] = details;
    data['notes'] = notes;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
