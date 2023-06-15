import 'package:doan/accessories/list_accessorie_pc.dart';
import 'package:doan/headphones_speakers/list_headphone_speaker.dart';
import 'package:doan/item/Guarantee.dart';
import 'package:doan/item/Storge.dart';
import 'package:doan/item/Tranfer.dart';
import 'package:doan/item/cart.dart';
import 'package:doan/item/cart_screen.dart';
import 'package:doan/keyboard/list_keyboard_pc.dart';
import 'package:doan/login/login.dart';
import 'package:doan/login/register.dart';
import 'package:doan/mouse/list_mouse_pc.dart';
import 'package:doan/pc_components/list_component_pc.dart';
import 'package:doan/pc_monitor/list_monitor_pc.dart';
import 'package:doan/pc_monitor/monitor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawer_app extends StatefulWidget {
  const Drawer_app({super.key});

  @override
  State<Drawer_app> createState() => _Drawer_appState();
}

class _Drawer_appState extends State<Drawer_app> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cpu.jpg'),
                  maxRadius: 40,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  user.email!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                // IconButton(
                //     onPressed: signUserOut, icon: const Icon(Icons.logout))
              ],
            ),
          ),

          //menu
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: const Text(
              'Danh Mục',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //Màn hình
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.computer),
            ),
            title: const Text('Màn hình', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListMonitorServicePage()));
            },
          ),
          //Linh kiện PC
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.laptop_chromebook),
            ),
            title: const Text('Linh kiện PC', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListCompinentServicePage()));
            },
          ),
          //tai nghe + loa
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.headset),
            ),
            title: const Text('Tai Nghe + Loa', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListHeadphoneSpeakerServicePage()));
            },
          ),
          // chuột
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.mouse),
            ),
            title:
                const Text('Chuột + Lót Chuột', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListMouseServicePage()));
            },
          ),
          //ban phim-----------------------------------------
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.keyboard),
            ),
            title: const Text('Bàn phím', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListKeyboardServicePage()));
            },
          ),
          //Phụ Kiện-----------------------------------------
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.usb),
            ),
            title: const Text('Phụ kiện', style: TextStyle(fontSize: 17)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListAccessorieServicePage()));
            },
          ),
          //information------------------------------
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: const Text(
              'Thông Tin',
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.w700, color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ExpansionTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.phone),
              ),
              title: GestureDetector(
                onTap: () {},
                child: const Text('Liên lạc', style: TextStyle(fontSize: 17)),
              ),
              children: [
                ExpansionTile(
                  title: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Thành phố Hồ Chí Minh',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  tilePadding: const EdgeInsets.only(left: 73, right: 50),
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 100),
                      title: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          '0345746288',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Hà Nội',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  tilePadding: const EdgeInsets.only(left: 73, right: 50),
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 100),
                      title: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          '0799747988',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),

          ListTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.build_outlined),
              ),
              title: const Text(
                'Chính sách bảo hành',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BaoHanh()),
                );
              }),
          ListTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.car_rental_outlined),
              ),
              title: const Text('Chính sách vận chuyển',
                  style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VanChuyen()),
                );
              }),
          ListTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.shopping_cart_outlined),
              ),
              title: const Text(
                'Giỏ hàng của bạn',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cart: Cart())),
                );
              }),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: Row(
              children: const [
                Text(
                  'Cài đặt',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.logout_outlined),
              ),
              title: const Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 18),
              ),
              onTap: signUserOut),
        ],
      ),
    );
  }
}
