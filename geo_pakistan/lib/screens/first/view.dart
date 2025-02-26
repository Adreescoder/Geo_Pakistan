import 'package:flutter/material.dart';
import 'package:geo_pakistan/screens/second_screen/view.dart';
import 'package:get/get.dart';
import '../../constans/colors.dart';
import 'logic.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final FirstLogic logic = Get.put(FirstLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top Illustration
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/pic/2.png'), // Replace with your image path
                ),
              ),
              // Title
              Text(
                "Learning is everything",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Learning with Pleasure with Dear Programmer, Wherever you Are.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> SecondPage(),
                      curve:Curves.ease,
                      transition: Transition.cupertinoDialog,
                      duration: Duration(seconds: 1),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color4,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: Text(
                    "Get Start",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}
