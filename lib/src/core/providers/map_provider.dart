import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_shop/src/data/api/api_service/api_services.dart';
import 'package:mobile_shop/src/data/models/address_response.dart';
import 'package:mobile_shop/src/utils/locator.dart';

import '../../data/api/api_constants/dio_exception.dart';
import '../../common widgets/dialog.dart';
import '../services/navigation_service.dart';

class MapProvider with ChangeNotifier {
  List<Address> addresses = [];
  final Set<Marker> markeres = {};
  late GoogleMapController controller;

  MapProvider() {
    getAddresses();
  }

  void onMapCreated(GoogleMapController controller, Address address) {
    controller = controller;
    addMarker(address);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarker(Address address) async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/icons/basic/location_filled.png', 75);

    markeres.add(
      Marker(
        markerId: MarkerId(
          address.id.toString(),
        ),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        position: LatLng(address.latitude!, address.longitude!),
        infoWindow: InfoWindow(
          title: '${address.name} - ${address.city} - ${address.region}',
          snippet: '${address.details} - ${address.notes}',
        ),
      ),
    );
    notifyListeners();
  }

  getAddresses() async {
    try {
      final response = await locator<ApiServices>().addressData();
      AddressResponse addressResponse = AddressResponse.fromJson(response.data);
      addresses = addressResponse.addresses!.data!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }
}
