import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{
  final RxInt leftUser = 0.obs;
  final RxInt rightUser = 0.obs;
  final List<IconData> icons = [
    Icons.person_outline_outlined,
    Icons.message,
    Icons.adaptive.share,
  ];

  final timeFormat = DateFormat("hh:mm");

  RxString currentTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    currentTime.value = timeFormat.format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime.value = timeFormat.format(DateTime.now());
    });

  }






}