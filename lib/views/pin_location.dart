import 'dart:async';

import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  State<PinLocationView> createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  Set<Marker> markers = {};
  final lating = const LatLng(
    31.129047430376474,
    31.28128794844732,
  );
  final _contrller = Completer<GoogleMapController>();
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showMsg('برجاء تفعيل خدمه الموقع');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    final pos = await Geolocator.getCurrentPosition();
    final googleMapController = await _contrller.future;
    markers.add(
      Marker(
        markerId: const MarkerId('myLocaition'),
        position: LatLng(pos.latitude, pos.longitude),
      ),
    );
    setState(() {});
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 17),
      ),
    );

    return pos;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Location'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) async {
          _contrller.complete(controller);
        },
        zoomControlsEnabled: false,
        markers: markers,
       
        initialCameraPosition: CameraPosition(zoom: 17, target: lating),
      ),
    );
  }
}
