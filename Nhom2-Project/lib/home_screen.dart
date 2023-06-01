import 'package:doan/catelory/catelory.dart';
import 'package:doan/drawer/drawer.dart';
import 'package:doan/header/header.dart';
import 'package:doan/keyboard/Keyboard_manufacturer.dart';
import 'package:doan/mouse/Mouse_PC.dart';
import 'package:doan/mouse/mouse_manufacturer.dart';
import 'package:doan/pc_monitor/Screen_PC.dart';
import 'package:doan/pc_monitor/screen_manufacturer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      drawer: Drawer_app(),

      //body trang chủ
      body: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: const Text(
                'Danh mục',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Danhmuc(),
            const SizedBox(
              height: 10,
            ),

            //Màn hình PC
            Container(
              child: const Text(
                'Màn hình PC',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const HangManHinh(),
            const ManHinhPC(),
            const SizedBox(
              height: 30,
            ),

            //Chuột
            Container(
              child: const Text(
                'Chuột',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const HangChuot(),
            const ChuotPC(),
            const SizedBox(
              height: 30,
            ),

            //Bàn phím
            Container(
              child: const Text(
                'Bàn phím',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const HangBanPhim(),
            const ManHinhPC()
          ]),
    );
  }
}
