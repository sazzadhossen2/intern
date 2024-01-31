import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intern/navigation_manue.dart';

void main() {
  runApp(const MyApps());
}
class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:Homepage() ,
    );
  }
}
