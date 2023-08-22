import 'package:billjek/Module/Order/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  static Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(-6.3152645, 106.6731133);
  static const LatLng destination = LatLng(-6.3467518, 106.7447385);

  final controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<LatLng> polylineCoordinates = [];

    void getPolyPoints() async {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDcICXB39G4nMI1QGZN-DwJ9Pp2NRNni8A", // Your Google Map Key
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
      );
      if (result.points.isNotEmpty) {
        result.points.forEach(
          (PointLatLng point) => polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          ),
        );
        // setState(() {});x
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          title: Text("Order"),
        ),
        body: Stack(children: [
          GoogleMap(
            polylines: controller.polylines,
            trafficEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: sourceLocation,
              zoom: 15,
            ),
            markers: {
              const Marker(
                markerId: MarkerId("source"),
                position: sourceLocation,
              ),
              const Marker(
                markerId: MarkerId("destination"),
                position: destination,
              ),
            },
            onMapCreated: (mapController) {
              _controller.complete(mapController);
            },
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.read_more,
              ),
              iconSize: 30,
              color: Colors.white,
              splashColor: Colors.grey,
              onPressed: () {
                Get.back();
              },
            ),
          )
        ]),
      ),
    );
  }
}
