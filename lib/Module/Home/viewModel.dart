import 'package:billjek/Utils/Color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var data = [
    {
      "title": "BillJek",
      "icon": Icon(Icons.motorcycle_outlined),
      "color": Colors.white,
      "iconColor": blue600
    },
    {
      "title": "BillCar",
      "icon": Icon(Icons.car_crash_outlined),
      "color": Colors.white,
      "iconColor": red600
    }
  ].obs;

  var promo = [
    {
      "title": "Promo Kemerdekaan",
      "subtitle": "sepesial kemerdekaan kamu dapat diskon 30%",
      "image":
          "https://images.unsplash.com/photo-1482029255085-35a4a48b7084?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2062&q=80",
    },
    {
      "title": "Promo Billjek",
      "subtitle": "Ajak temanmu menggunakan Billjek",
      "image":
          "https://images.unsplash.com/photo-1482029255085-35a4a48b7084?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2062&q=80",
    }
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return data;
      // throw Exception("Custom Error");
    });
  }

  Future<List> getPromo() {
    return Future.delayed(Duration(seconds: 2), () {
      return promo;
      // throw Exception("Custom Error");
    });
  }
}
