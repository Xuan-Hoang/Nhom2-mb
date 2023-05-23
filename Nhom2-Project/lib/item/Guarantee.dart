import 'package:flutter/material.dart';

class BaoHanh extends StatefulWidget {
  const BaoHanh({super.key});

  @override
  State<BaoHanh> createState() => _BaoHangState();
}

class _BaoHangState extends State<BaoHanh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng của bạn'),
      ),
    );
  }
}
