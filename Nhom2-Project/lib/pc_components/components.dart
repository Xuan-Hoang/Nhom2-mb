import 'package:doan/header/header.dart';
import 'package:doan/mouse/mouse_manufacturer.dart';
import 'package:doan/pc_components/catelory_components.dart';
import 'package:doan/sorted_by.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinhKien extends StatefulWidget {
  const LinhKien({super.key});

  @override
  State<LinhKien> createState() => _LinhKienState();
}

class _LinhKienState extends State<LinhKien> {
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

            //Linh kiện PC
            Container(
              child: const Text(
                'Màn hình PC',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const HangChuot(),
            const DanhMucLinhKien(),
            const SizedBox(
              height: 30,
            ),
          ]),
    );
  }
}
