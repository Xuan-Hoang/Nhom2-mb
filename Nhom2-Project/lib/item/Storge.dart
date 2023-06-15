// import 'package:flutter/material.dart';

// class GioHang extends StatefulWidget {
//   final double price;
//   final String name;
//   final String image;
//   GioHang({this.price,  this.name,  this.image});

//   @override
//   _GioHangState createState() => _GioHangState();
// }

// class _GioHangState extends State<GioHang> {
//   int count = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Giỏ hàng của bạn'),
//       ),
//       body: Container(
//         height: 150,
//         width: double.infinity,
//         child: Card(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     height: 130,
//                     width: 150,
//                     decoration:  BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage('assets/images/${widget.image}'),
//                       ),
//                     ),
//                   ),
//                  const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     height: 140,
//                     width: 200,
//                     child: ListTile(
//                       title: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(widget.name),
                          
//                           Text('\$${widget.price}'),
//                           Container(
//                             height: 35,
//                             width: 120,
//                             color: Color.fromARGB(255, 248, 246, 246),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 GestureDetector(
//                                   child: const Icon(Icons.remove),
//                                   onTap: () {
//                                     setState(() {
//                                       if (count > 1) {
//                                         count--;
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   count.toString(),
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                                 GestureDetector(
//                                   child: const Icon(Icons.add),
//                                   onTap: () {
//                                     setState(() {
//                                       count++;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
