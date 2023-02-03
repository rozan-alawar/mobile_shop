import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_shop/src/core/providers/map_provider.dart';

class GoogleMapAddress extends StatelessWidget {
  const GoogleMapAddress({
    Key? key,
    required this.provider,
    required this.index,
  }) : super(key: key);

  final MapProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      height: 150.h,
      child: GoogleMap(
        markers: provider.markeres,
        initialCameraPosition: CameraPosition(
            target: LatLng(
              provider.addresses[index].latitude!,
              provider.addresses[index].longitude!,
            ),
            zoom: 12),
        onMapCreated: (controller) => provider.onMapCreated(
          controller,
          provider.addresses[index],
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
