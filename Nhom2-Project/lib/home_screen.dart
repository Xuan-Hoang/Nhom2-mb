import 'package:doan/pc_monitor/Screen_PC.dart';
import 'package:doan/pc_monitor/catelory_monitor.dart';
import 'package:doan/pc_monitor/screen_manufacturer.dart';
import 'package:flutter/material.dart';
import 'package:doan/catelory/catelory.dart';
import 'package:doan/drawer/drawer.dart';
import 'package:doan/header/header.dart';
import 'package:doan/keyboard/Keyboard_manufacturer.dart';
import 'package:doan/mouse/Mouse_PC.dart';
import 'package:doan/mouse/mouse_manufacturer.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      drawer: const Drawer_app(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Danh sách sản phẩm',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Danhmuc(),
          const SizedBox(
            height: 10,
          ),
          //Man hinh
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Màn Hình',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const HangManHinh(),
          ProductServicePage(),
          //chuot
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Chuột',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const HangChuot(),
          MouseServicePage(),
          //ban phim
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bàn phím',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const HangBanPhim(),
        ],
      ),
    );
  }
}
