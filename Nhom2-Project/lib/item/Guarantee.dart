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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/logoBaoHanh.jpg',
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: const Text(
                'Chính sách bảo hành',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.redAccent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin bảo hành',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Các sản phẩm của chúng tôi được bảo hành có giới hạn bao gồm các lỗi về vật liệu và tay nghề trong thời hạn một năm kể từ ngày mua. Bảo hành này không bao gồm các hư hỏng do sử dụng sai, lạm dụng hoặc hao mòn thông thường.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Gửi yêu cầu bảo hành',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Để gửi yêu cầu bảo hành, vui lòng làm theo các bước sau:',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 16.0),
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.blueGrey[900],
                              ),
                              title: const Text(
                                'Gửi email cho chúng tôi theo địa chỉ lugearandcomputer@gmail.com kèm theo tên, địa chỉ, số đơn đặt hàng và mô tả lỗi của bạn.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ListTile(
                              leading: Icon(
                                Icons.check,
                                color: Colors.blueGrey[900],
                              ),
                              title: const Text(
                                'Chúng tôi sẽ xem xét khiếu nại của bạn và trả lời trong vòng 5 ngày làm việc.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Nếu khiếu nại của bạn được chấp thuận, chúng tôi sẽ cung cấp hướng dẫn trả lại sản phẩm và nhận sản phẩm thay thế hoặc hoàn lại tiền.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
