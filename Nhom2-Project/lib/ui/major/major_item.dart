import 'package:flutter/material.dart';
import 'package:doan/model/major.dart';

class MajorItem extends StatelessWidget {
  final Major major;
  final Function(Major major) onClick;
  final Function(Major major)? onDelete;
  MajorItem({required this.major, required this.onClick, this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          InkWell(child: Text('${major.name}'), onTap: () =>  onClick(major),),
          Spacer(),
          IconButton(onPressed: onDelete == null ? null : () =>  onDelete!(major),
           icon: Icon(Icons.delete, color: Colors.red,)),
        ],
      ),
    );
  }
}
