import 'package:doan/item/Guarantee.dart';
import 'package:doan/item/Storge.dart';
import 'package:doan/login/login.dart';
import 'package:doan/pc_monitor/Screen.dart';
import 'package:doan/login/register.dart';
import 'package:flutter/material.dart';

class Drawer_app extends StatefulWidget {
  const Drawer_app({super.key});

  @override
  State<Drawer_app> createState() => _Drawer_appState();
}

class _Drawer_appState extends State<Drawer_app> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.cyan],
                      ),
                    ),
                    child: const Text(
                      'LURGEAR',
                      textScaleFactor: 2.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.computer),
            ),
            title: const Text('Màn hình', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Asus',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ManHinh()));
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Acer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
          //Linh kiện PC
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.laptop_chromebook),
            ),
            title: const Text('Linh kiện PC', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'VGA - Card màn hình',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'CPU - Bọo vi xử lý',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bo mạch chủ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Ram - Bộ nhớ trong',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Lưu trữ SSD - HDD',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Case - Vỏ máy tính',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'PSU - Nguồn máy tính',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Tản nhiệt - Fan RGB',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
          //tai nghe + loa
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.headset),
            ),
            title: const Text('Tai Nghe + Loa', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Tai Nghe Chụp Tai',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Tai Nghe Điện Thoại',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Tai Nghe Bluetooth',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Loa',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Loa Bluetooth',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
          // chuột
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.mouse),
            ),
            title:
                const Text('Chuột + Lót Chuột', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Chuột Gaming',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Chuột Văn Phòng',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Chuột Bluetooth',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Lót Chuột',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
          //ban phim-----------------------------------------
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.keyboard),
            ),
            title: const Text('Bàn phím', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bàn Phím Cơ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bàn Phím Giả Cơ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bàn Phím Văn Phòng',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
          //Phụ Kiện-----------------------------------------
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.usb),
            ),
            title: const Text('Phụ kiện', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Microphone',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Webcam',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'SoundCard',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Tản Nhiệt Laptop',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'SSD-HDD',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
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
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.message_outlined),
            ),
            title:
                const Text('Tư vấn mua hàng', style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bạn cần mua màn hình ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.1 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bạn cần mua tai nghe và loa ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bạn cần mua chuột ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.3 được nhấn
                },
              ),
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Bạn cần mua bàn phím ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.4 được nhấn
                },
              ),
            ],
          ),
          ListTile(
              leading: const IconTheme(
                data: IconThemeData(size: 23),
                child: Icon(Icons.build_outlined),
              ),
              title: const Text(
                'Chính sách bảo hành',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
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
                  MaterialPageRoute(builder: (context) => const GioHang()),
                );
              }),
        ],
      ),
    );
  }
}
