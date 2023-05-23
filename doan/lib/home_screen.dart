import 'package:doan/accessory/accessory.dart';
import 'package:doan/headphones+speakers/headphones+speakers.dart';
import 'package:doan/item/Guarantee.dart';
import 'package:doan/item/Storge.dart';
import 'package:doan/keyboard/keyboard.dart';
import 'package:doan/login.dart';
import 'package:doan/mouse/mouse.dart';
import 'package:doan/pc_components/pc_components.dart';
import 'package:doan/pc_monitor/Screen.dart';
import 'package:doan/register.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    // xử lý khi nhấn vào giỏ hàng
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GioHang()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                // const Text(
                //   'LURGEAR',
                //   textScaleFactor: 2.5,
                //   style: TextStyle(
                //       color: Colors.white, fontWeight: FontWeight.bold),
                // ),
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()),
                              );
                            },
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Đăng ký',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Đăng nhập',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ],
                    ),
                  ],
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BaoHanh()),
                );
              }),
          ExpansionTile(
            leading: const IconTheme(
              data: IconThemeData(size: 23),
              child: Icon(Icons.car_rental_outlined),
            ),
            title: const Text('Chính sách vận chuyển',
                style: TextStyle(fontSize: 17)),
            children: [
              ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Nội thành TPHCM & Hà Nội',
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
                    'Ngoại thành',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                onTap: () {
                  // Xử lý khi mục 1.2 được nhấn
                },
              ),
            ],
          ),
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
      )),

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManHinh(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/manhinh.png',
                                ),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Màn hình PC',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LinhKienPC(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/card.jpg'),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Linh kiện PC',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TaiNgheLoa(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/tainghe.jpg'),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Tai nghe, loa',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Chuot(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/chuot.jpg'),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Chuột, lót chuột',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BanPhim(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/banphim.jpg'),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Bàn phím',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PhuKien(),
                              ));
                        },
                        child: Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 239, 233, 233),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/phukien.jpg'),
                                fit: BoxFit.scaleDown),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Phụ kiện',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Asus'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Acer'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('LG'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    constraints: const BoxConstraints(
                        maxHeight: 450.0,
                        maxWidth: 400.0,
                        minWidth: 150.0,
                        minHeight: 150.0),
                    child:
                        //  GridView.count(
                        //     primary: false,
                        //     padding: const EdgeInsets.all(20),
                        //     crossAxisSpacing: 20,
                        //     mainAxisSpacing: 15,
                        //     crossAxisCount: 2,
                        //     childAspectRatio: 0.4,

                        ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/asus_xg276q_gearvn_84eaf01bccfc439698b0e1f2e313de66.jpg',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Màn hình ASUS ROG Strix XG276Q 27" IPS 170Hz Gsync chuyên game',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '7,590,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  'https://www.lg.com/vn/images/man-hinh-may-tinh/md07527526/gallery/D1.jpg',
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Màn hình LG Gaming 27 inch ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '5.890.000 ₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/acer_k273_e_gearvn_d2733a7d81464d35ae3093c279146403.jpg',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Màn hình Acer K273 E 27" IPS 100Hz',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '3,390,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
              ),
            ),
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
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Asus'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Razer'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Logitech'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    constraints: const BoxConstraints(
                        maxHeight: 450.0,
                        maxWidth: 400.0,
                        minWidth: 150.0,
                        minHeight: 150.0),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/gearvn-chuot-asus-rog-harpe-ace-aim-lap-edition-1_37cafa812da94df3872eb2058056fc31.png',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Chuột ASUS ROG Harpe Ace Aim Lab Edition ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '2,690,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/gearvn-chuot-logitech-g-pro-x-superlight-wireless-red-1_e9b9c83c5b014121b05142091ca1a7b7.jpg',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Chuột Logitech G Pro X Superlight Wireless Red',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '2,890,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/thumbchuot_d48b1fc55115417cae8e12993f1103b0.gif',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Chuột Razer Deathadder V3 Pro Faker Edition',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '4,390,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
              ),
            ),
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
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Asus'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Akko'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.4),
                        color: Color.fromARGB(222, 242, 240, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text('Razer'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    constraints: const BoxConstraints(
                        maxHeight: 450.0,
                        maxWidth: 400.0,
                        minWidth: 150.0,
                        minHeight: 150.0),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/thumbphim_d829ff88d74d4ababb105793cd37dd09.gif',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bàn phím cơ AKKO 5075B Plus Dragon Ball Super Goku ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '2,990,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/thumbphim3_6416652ede6b455dbf423826e12fdc6a.gif',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bàn phím cơ Asus ROG Falchion Ace Black',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '3,290,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Mua kèm giá treo màn hình giảm thêm đến 100.000đ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://product.hstatic.net/1000026716/product/thumbphim_f3885b3f5138471a957514abaece8391.png',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bàn phím Logitech G512 GX RGB (Clicky)',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        '2,090,000₫',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Giao hàng miễn phí',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: _toggleFavorite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _isFavorite
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          const Text(
                                            'Yêu Thích',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
              ),
            ),
          ]),
    );
  }
}
