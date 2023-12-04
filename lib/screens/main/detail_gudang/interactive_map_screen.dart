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
            infoWindow: InfoWindow(
              title: widget.name,
              // snippet: widget.description,
            ),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(warehouseLatLng);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: warehouseLatLng, zoom: 12.0)));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class WarehouseMapScreen extends StatefulWidget {
//   final double lat;
//   final double long;
//   final String name;

//   WarehouseMapScreen(
//       {required this.lat, required this.long, required this.name});

//   @override
//   _WarehouseMapScreenState createState() => _WarehouseMapScreenState();
// }

// class _WarehouseMapScreenState extends State<WarehouseMapScreen> {
//   late GoogleMapController mapController;
//   late LatLng userLocation;
//   late LatLng warehouseLatLng;

//   @override
//   void initState() {
//     super.initState();
//     getUserLocation().then((location) {
//       if (location != null) {
//         setState(() {
//           userLocation = location;
//           warehouseLatLng =
//               calculateRelativePosition(userLocation, widget.lat, widget.long);
//         });
//       } else {
//         // Handle the case when user location is not available
//         // You might want to show an error message or take appropriate action
//         print('User location not available');
//       }
//     });
//   }

//   Future<LatLng?> getUserLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition();
//       return LatLng(position.latitude, position.longitude);
//     } catch (e) {
//       // Handle the case when user location cannot be obtained
//       print('Error getting user location: $e');
//       return null;
//     }
//   }

//   LatLng calculateRelativePosition(
//       LatLng userLocation, double relativeLat, double relativeLong) {
//     double newLat = userLocation.latitude + relativeLat;
//     double newLong = userLocation.longitude + relativeLong;
//     return LatLng(newLat, newLong);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//         initialCameraPosition: CameraPosition(
//           target: warehouseLatLng ?? LatLng(0, 0),
//           zoom: 15.0,
//         ),
//         markers: <Marker>[
//           Marker(
//             markerId: MarkerId('warehouse_marker'),
//             position: warehouseLatLng ?? LatLng(0, 0),
//             infoWindow: InfoWindow(
//               title: widget.name,
//               snippet: 'Warehouse Location',
//             ),
//           ),
//         ].toSet(),
//       ),
//     );
//   }
// }

// import 'package:capstone_wms/classes/text_collection.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class WarehouseMapScreen extends StatefulWidget {
//   final double lat;
//   final double long;
//   final String name;

//   WarehouseMapScreen(
//       {required this.lat, required this.long, required this.name});

//   @override
//   _WarehouseMapScreenState createState() => _WarehouseMapScreenState();
// }

// class _WarehouseMapScreenState extends State<WarehouseMapScreen> {
//   late GoogleMapController mapController;
//   late LatLng userLocation;
//   LatLng? warehouseLatLng;

//   @override
//   void initState() {
//     super.initState();
//     getUserLocation().then((location) {
//       if (location != null) {
//         setState(() {
//           userLocation = location;
//           warehouseLatLng =
//               calculateRelativePosition(userLocation, widget.lat, widget.long);
//         });
//       } else {
//         // Handle the case when user location is not available
//         // You might want to show an error message or take appropriate action
//         print('User location not available');
//       }
//     });
//   }

//   Future<LatLng?> getUserLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition();
//       print(position);

//       return LatLng(position.latitude, position.longitude);
//     } catch (e) {
//       print('Error getting user location: $e');
//       return null;
//     }
//   }

//   LatLng? calculateRelativePosition(
//       LatLng userLocation, double relativeLat, double relativeLong) {
//     double newLat = userLocation.latitude + relativeLat;
//     double newLong = userLocation.longitude + relativeLong;
//     return LatLng(newLat, newLong);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lokasi Gudang", style: TextCollection().heading5),
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//         initialCameraPosition: CameraPosition(
//           target: warehouseLatLng ?? LatLng(0, 0),
//           zoom: 15.0,
//         ),
//         markers: <Marker>[
//           Marker(
//             markerId: MarkerId('warehouse_marker'),
//             position: warehouseLatLng ?? LatLng(0, 0),
//             infoWindow: InfoWindow(
//               title: widget.name,
//               // snippet: 'Warehouse Location',
//             ),
//           ),
//         ].toSet(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print(warehouseLatLng);
//           mapController.animateCamera(
//             CameraUpdate.newCameraPosition(
//               CameraPosition(
//                 target: warehouseLatLng != null
//                     ? warehouseLatLng!
//                     : LatLng(0, 0), // check for null before assigning
//                 zoom: 12.0,
//               ),
//             ),
//           );
//         },
//         child: Icon(Icons.location_searching_rounded),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//     );
//   }
// }
