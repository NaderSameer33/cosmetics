import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckoutMap extends StatefulWidget {
  const CheckoutMap({
    super.key,
  });

  @override
  State<CheckoutMap> createState() => _CheckoutMapState();
}

class _CheckoutMapState extends State<CheckoutMap> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.035736, 31.352704),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(31.035736, 31.352704),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.r),
      height: 84.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.transparent,
        border: Border.all(
          color: const Color(0xff73B9BB),
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60.h,
            width: 90.w,

            child: GoogleMap(
              zoomControlsEnabled: false,

              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
           SizedBox(
            width: 5.w,
          ),
           Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  'Mansoura 14  St',
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -1.5708,

            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffDA498C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
