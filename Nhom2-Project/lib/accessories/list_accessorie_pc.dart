import 'package:doan/accessories/accessorie.dart';
import 'package:doan/catelory/sorted_by.dart';
import 'package:doan/header/header.dart';
import 'package:doan/item/cart.dart';
import 'package:doan/pc_monitor/monitor.dart';
import 'package:doan/pc_monitor/monitor_pc.dart';

import 'package:doan/product_api/monitor_pc_produc_detail.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListAccessorieServicePage extends StatefulWidget {
  @override
  _ListAccessorieServicePageState createState() => _ListAccessorieServicePageState();
}

class _ListAccessorieServicePageState extends State<ListAccessorieServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
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
          AccessorieServicePage1(),
        ],
      ),
    );
  }
}
