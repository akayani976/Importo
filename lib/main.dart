import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/views/log_in.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 27, 156, 207),
    ),
    home: const LogInPage(),
  ));
}