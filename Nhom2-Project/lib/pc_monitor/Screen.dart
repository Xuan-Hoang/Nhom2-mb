import 'package:doan/header/header.dart';
import 'package:doan/pc_monitor/catelory_monitor.dart';
import 'package:doan/pc_monitor/screen_manufacturer.dart';
import 'package:doan/catelory/sorted_by.dart';
import 'package:flutter/material.dart';

class ManHinh extends StatefulWidget {
  const ManHinh({super.key});

  @override
  State<ManHinh> createState() => _ManHinhState();
}

class _ManHinhState extends State<ManHinh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: const Text(
                'Sắp xếp theo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Sapxep(),
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
            const DanhMucManHinh(),
            const SizedBox(
              height: 30,
            ),
          ]),
    );
  }
}
