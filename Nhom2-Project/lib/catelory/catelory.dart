import 'package:doan/accessories/list_accessorie_pc.dart';
import 'package:doan/headphones_speakers/headphones_speakers_pc.dart';
import 'package:doan/headphones_speakers/list_headphone_speaker.dart';
import 'package:doan/keyboard/keyboard.dart';
import 'package:doan/keyboard/list_keyboard_pc.dart';
import 'package:doan/mouse/list_mouse_pc.dart';
import 'package:doan/mouse/mouse.dart';
import 'package:doan/pc_components/components.dart';
import 'package:doan/pc_components/list_component_pc.dart';
import 'package:doan/pc_monitor/list_monitor_pc.dart';
import 'package:doan/pc_monitor/monitor.dart';
// import 'package:doan/pc_monitor/monitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Danhmuc extends StatefulWidget {
  const Danhmuc({super.key});

  @override
  State<Danhmuc> createState() => _DanhmucState();
}

class _DanhmucState extends State<Danhmuc> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListMonitorServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/manhinh.png",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Màn hình PC",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListCompinentServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/card.jpg",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Linh kiện PC",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListHeadphoneSpeakerServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/tainghe.jpg",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Tai nghe, loa",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListMouseServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/chuot.jpg",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Chuột, lót chuột",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListKeyboardServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/banphim.jpg",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Bàn phím",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListAccessorieServicePage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                "assets/images/phukien.jpg",
                                height: 60,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Phụ kiện",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
