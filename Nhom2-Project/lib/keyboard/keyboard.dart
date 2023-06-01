import 'package:doan/header/header.dart';
import 'package:flutter/material.dart';

class BanPhim extends StatefulWidget {
  const BanPhim({super.key});

  @override
  State<BanPhim> createState() => _BanPhimState();
}

class _BanPhimState extends State<BanPhim> {
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
        title: const Header(),
      ),

      //body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: const Text(
              'Chọn theo tiêu chí',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                const SizedBox(width: 16.0),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      accentColor: Colors.grey[600],
                      unselectedWidgetColor: Colors.grey[600],
                    ),
                    child: ExpansionTile(
                      title: Row(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8.0),
                          Text('Tình Trạng'),
                        ],
                      ),
                      children: const [
                        // các widget con
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      accentColor: Colors.grey[600],
                      unselectedWidgetColor: Colors.grey[600],
                    ),
                    child: ExpansionTile(
                      title: Row(
                        children: const [
                          Icon(Icons.monetization_on_outlined,
                              color: Colors.green),
                          SizedBox(width: 8.0),
                          Text('Giá Cả'),
                        ],
                      ),
                      children: const [
                        // các widget con
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 17),
            child: const Text(
              'Sắp xếp theo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 17,
                      ),
                      label: const Text('Giá Cao - Thấp')),
                ),
                const SizedBox(
                  width: 17,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_upward,
                        size: 17,
                      ),
                      label: const Text('Giá Thấp - Cao')),
                ),
                const SizedBox(
                  width: 17,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.percent),
                      label: const Text('Khuyến mãi hot')),
                ),
                const SizedBox(
                  width: 17,
                ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(left: 17),
          //   child: const Text(
          //     'Chọn Nhu Cầu',
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 0.4,
              children: <Widget>[
                Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 10),
                            const Text(
                              'Mua kèm giá treo màn hình giảm thêm đến 100.000đ',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 13),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
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
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _toggleFavorite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _isFavorite
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border,
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
                //sp2
                Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 10),
                            const Text(
                              'Mua kèm giá treo màn hình giảm thêm đến 100.000đ',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 13),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
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
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _toggleFavorite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _isFavorite
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border,
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
                //sp3
                Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 10),
                            const Text(
                              'Mua kèm giá treo màn hình giảm thêm đến 100.000đ',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 13),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
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
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _toggleFavorite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _isFavorite
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border,
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
                //sp4
                Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 10),
                            const Text(
                              'Mua kèm giá treo màn hình giảm thêm đến 100.000đ',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 13),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
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
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _toggleFavorite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _isFavorite
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
