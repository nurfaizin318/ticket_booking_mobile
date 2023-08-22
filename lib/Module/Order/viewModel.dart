import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderController extends GetxController {
  final Set<Polyline> polylines = {};
  var pol = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    polylines.add(const Polyline(
      polylineId: PolylineId('polyline_id'), // ID unik untuk Polyline
      color: Colors.blue, // Warna garis
      points: [
        LatLng(-6.3152645, 106.6731133), // Koordinat awal
        LatLng(-6.3467518, 106.7447385), // Koordinat akhir
      ],
    ));
  }
}
