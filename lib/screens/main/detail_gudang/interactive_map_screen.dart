import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InteractiveMap extends StatefulWidget {
  InteractiveMap({super.key, required this.lat, required this.long});

  double lat;
  double long;

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  LatLng? warehousePosition;
  GoogleMapController? mapController;
  final Set<Marker> markers = {};

  @override
  void initstate() {
    super.initState();
    warehousePosition = LatLng(widget.lat, widget.long);
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

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
          target: warehousePosition!,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Latitude: ${widget.lat}, Longitude: ${widget.long}');
        },
      ),
    );
  }
}
