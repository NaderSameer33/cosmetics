import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(31.0447334525171, 31.34972404160145),
    zoom: 14,
  );
  final _controller = Completer<GoogleMapController>();
  String? mapStyle;

  @override
  void initState() {
    super.initState();
    setStyle();
  }

  Future<void> setStyle() async {
    final style = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/lotties/map_style.json');
    setState(() {
      mapStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GoogleMap(
        markers: {
          const Marker(
            position: LatLng(31.0447334525171, 31.34972404160145),
            markerId: MarkerId('mansoura'),
          ),
        },
        style: mapStyle,
        initialCameraPosition: _cameraPosition,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
