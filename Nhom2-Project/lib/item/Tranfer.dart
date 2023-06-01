import 'package:flutter/material.dart';

class VanChuyen extends StatefulWidget {
  const VanChuyen({super.key});

  @override
  State<VanChuyen> createState() => VanChuyenState();
}

class VanChuyenState extends State<VanChuyen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/logoVanChuyen.jpg',
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: const Text(
                'Chính sách vận chuyển',
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
                        'Chính sách giao hàng',
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
                          'Để tăng thêm sự thuận tiện và dễ dàng cho Quý khách khi mua sắm online, LUGEAR hỗ trợ giao hàng tới tận tay khách hàng trên toàn quốc.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Liên hệ ',
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
                              'Đặt hàng sản phẩm của bạn, vui lòng làm theo các bước sau:',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 16.0),
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.blueGrey[900],
                              ),
                              title: const Text(
                                'Gửi email cho chúng tôi theo địa chỉ lugearandcomputer@gmail.com kèm theo tên, địa chỉ, số đơn đặt hàng, tên và thông tin liên hệ của bạn.',
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
                                'Chúng tôi sẽ xem xét yêu cầu của bạn và chuyển chính sách cho bạn trong vòng 3 ngày làm việc.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ListTile(
                              leading: Icon(
                                Icons.person,
                                color: Colors.blueGrey[900],
                              ),
                              title: const Text(
                                'Bạn sẽ nhận được email xác nhận.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Chính sách giao hàng trong nội thành TP HCM & Hà Nội ',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 16.0),
                            ListTile(
                              leading: Text(
                                'TP HCM',
                                style: TextStyle(fontSize: 19.0),
                              ),
                              title: Text(
                                'Nội thành TP. Hồ Chí Minh: Quận 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, Thủ Đức, Tân Phú, Tân Bình, Phú Nhuận, Gò Vấp, Bình Thạnh, Bình Tân.',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ListTile(
                              leading: Text(
                                'Hà Nội',
                                style: TextStyle(fontSize: 19.0),
                              ),
                              title: Text(
                                'Nội thành Hà Nội: Quận Ba Đình, Hoàn Kiếm, Tây Hồ, Long Biên, Cầu Giấy, Đống Đa, Hai Bà Trưng, Hoàng Mai, Thanh Xuân, Nam Từ Liêm, Bắc Từ Liêm, Hà Đông.',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ListTile(
                              leading: Icon(
                                Icons.car_rental_outlined,
                                color: Colors.black,
                              ),
                              title: Text(
                                'Miễn phí vận chuyển cho các đơn hàng nội thành TP. HCM và Hà Nội',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Ngoại Thành',
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
                          children: const [
                            Text(
                              'Bao gồm 2 hình thức: Giao hàng thu tiền COD & Giao hàng không thu tiền',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 16.0),
                            ListTile(
                              leading: Text(
                                'Thu tiền COD',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                'Miễn phí vận chuyển cho các đơn hàng COD trên toàn quốc',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                  'Lưu ý không áp dụng các sản phẩm: Màn hình,PC, Laptop,Loa '),
                            ),
                            SizedBox(height: 16.0),
                            ListTile(
                              leading: Text(
                                'Không thu tiền',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                'Miễn phí vận chuyển cho các đơn hàng trên toàn quốc',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                  'Lưu ý khách hàng phải thanh toán tổng giá trị đơn hàng trước cho GEARVN.   '),
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
