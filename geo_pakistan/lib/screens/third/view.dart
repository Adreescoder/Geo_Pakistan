import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatefulWidget {
  final String courseName;
  final String courseImage;
  final List<Map<String, String>> videos;

  const ThirdPage({
    super.key,
    required this.courseName,
    required this.courseImage,
    required this.videos,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool showVideos = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200], // Replace color3
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 7),
                // Course Image
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54, // Replace color1
                    ),
                    height: 180,
                    width: double.infinity,
                    child: Image.asset(
                      widget.courseImage,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, size: 50, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
                // Course Description
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.courseName} COMPLETE COURSE\nCREATED BY ME!',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54, // Replace color1
                      ),
                    ),
                  ),
                ),
                // Buttons to toggle views
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildToggleButton("Videos", showVideos, true),
                        _buildToggleButton("Description", showVideos, false),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Conditional content based on button
                showVideos
                    ? _buildVideoList()
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'This is the course description. Learn everything about ${widget.courseName} in this comprehensive course.',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool condition, bool setTo) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: condition == setTo ? Colors.blue : Colors.blue[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () => setState(() => showVideos = setTo),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVideoList() {
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: ListView.builder(
        padding: const EdgeInsets.all(6),
        itemCount: widget.videos.length,
        itemBuilder: (context, index) {
          final video = widget.videos[index];
          return Column(
            children: [
              buildWidget(
                color1: Colors.black26,
                title: video['title']!,
                duration: video['duration']!,
                icon: Icons.play_circle_outline,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}

Widget buildWidget({
  required Color color1,
  required String title,
  required String duration,
  required IconData icon,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color1,
      borderRadius: BorderRadius.circular(12),
    ),
    height: 80,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      children: [
        Icon(icon, size: 55, color: Colors.white),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
