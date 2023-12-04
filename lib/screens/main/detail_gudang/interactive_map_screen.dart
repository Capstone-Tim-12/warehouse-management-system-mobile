import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  LatLng defaultPosition = const LatLng(37.42796133580664, -122.085749655962);
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: ColorApp().secondaryColor),
        title: Text(
          "Lokasi Gudang",
          style: TextCollection().heading5,
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: defaultPosition,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        // markers: ,
      ),
    );
  }
}
