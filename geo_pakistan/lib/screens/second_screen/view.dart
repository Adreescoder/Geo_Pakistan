import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geo_pakistan/screens/third/view.dart';
import 'package:get/get.dart';

import '../../constans/colors.dart';
import '../first/view.dart';
import 'logic.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  final SecondScreenLogic logic = Get.put(SecondScreenLogic());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width < 600;
    return SafeArea(
      child: Scaffold(
        backgroundColor: color3,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(
                                    () => FirstPage(),
                                curve: Curves.ease,
                                transition: Transition.fade,
                                duration: Duration(seconds: 1),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: color1,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.grid_view_rounded, color: color1),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_active, color: color1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                   SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Text(
                        'Hi, Programmers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Gap(50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: color1,
                        ),
                        child: const TextField(
                          cursorColor: Colors.black26,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search Here...',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  spacing: 20.0,
                  children: [
                    eightBuild(name: "Category", iconData: Icons.category_outlined),
                    eightBuild(name: "Classes", iconData: Icons.video_collection),
                    eightBuild(name: "FreeCourses", iconData: Icons.post_add_outlined),
                    eightBuild(name: "BookShop", iconData: Icons.store),
                    eightBuild(name: "LiveCourses", iconData: Icons.play_circle_outline),
                    eightBuild(name: "LeaderBoard", iconData: Icons.leaderboard),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Text(
                      "Courses:",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: color1),
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 30.0,
                runSpacing: 20,
                children: [
                  buildCourseCard(
                    'Flutter',
                    'assets/pic/flutter.png',
                    '25 Videos',
                    context,
                  ),

                  buildCourseCard(
                    'JS',
                    'assets/pic/3.png',
                    '25 Videos',
                    context,
                  ), buildCourseCard(
                    'Python',
                    'assets/pic/6.png',
                    '25 Videos',
                    context,
                  ),

                  buildCourseCard(
                    'Dart',
                    'assets/pic/1.png',
                    '20 Videos',
                    context,
                  ),
                  addCourses(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourseCard(String  name, String image, String subtitle, BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
              () => ThirdPage(
            courseName: name,
            courseImage: image,
            videos: [
              {'title': 'Introduction to $name', 'duration': '20 min 50 sec'},
              {'title': '$name Basics', 'duration': '15 min 30 sec'},
            ],
          ),
          curve: Curves.ease,
          transition: Transition.fade,
          duration: Duration(seconds: 1),
        );
      },
      child: bigBuild(name: name, image: image, subtitle: subtitle),
    );
  }
}

Widget eightBuild({required String name, required IconData iconData}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: color2,
        child: Icon(
          iconData,
          size: 40,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color1,
        ),
      ),
    ],
  );
}

Widget bigBuild({required String name, required String image, required String subtitle}) {
  return Container(
    alignment: Alignment.center,
    width: 150,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color2,
    ),
    child: Column(
      children: [
        const SizedBox(height: 20),
        Image.asset(image, width: 100, height: 100),
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color1),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          style: TextStyle(color: color1),
        ),
      ],
    ),
  );
}

Widget addCourses() {
  return Container(
    alignment: Alignment.center,
    width: 150,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color2,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 40,
              color: color2,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Add Course",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color1,
          ),
        ),
      ],
    ),
  );
}
