import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        liteModeEnabled: true,

        myLocationButtonEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(31.03855616745037, 31.337922322532297),
          zoom: 16,
        ),
      ),
    );
  }
}
