import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WarehouseMapScreen extends StatefulWidget {
  final double lat;
  final double long;
  final String name;

  WarehouseMapScreen({
    required this.lat,
    required this.long,
    required this.name,
  });

  @override
  _WarehouseMapScreenState createState() => _WarehouseMapScreenState();
}

class _WarehouseMapScreenState extends State<WarehouseMapScreen> {
  late GoogleMapController mapController;
  late LatLng warehouseLatLng;

  @override
  void initState() {
    super.initState();
    warehouseLatLng = LatLng(widget.lat, widget.long);
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: colorApp.secondaryColor),
        title: Text(
          'Lokasi Gudang',
          style: TextCollection().heading6,
        ),
      ),
      body: GoogleMap(
        buildingsEnabled: true,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: warehouseLatLng,
          zoom: 15.0,
        ),
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('warehouse_marker'),
            position: warehouseLatLng,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: widget.name,
              // snippet: widget.description,
            ),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorApp.secondaryColor,
        onPressed: () {
          print(warehouseLatLng);
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: warehouseLatLng, zoom: 12.0),
            ),
          );
        },
        child: Icon(
          Icons.location_searching_rounded,
          color: colorApp.light4,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
