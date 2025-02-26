import 'package:flutter/material.dart';
import 'package:geo_pakistan/screens/first/view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coding",
      home: FirstPage(),
    );
  }
}
