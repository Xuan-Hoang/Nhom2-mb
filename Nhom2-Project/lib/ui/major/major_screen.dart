import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doan/model/major.dart';
import 'package:doan/ui/major/major_item.dart';
import 'package:doan/ui/major/major_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MajorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final majorViewModel = MajorViewModel();
    return ScopedModel(
        model: majorViewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Major'),
            actions: [
              IconButton(
                  onPressed: () => showEditDialog(context, majorViewModel),
                  icon: Icon(Icons.add))
            ],
          ),
          body: listMajors(),
        ));
  }

  Widget listMajors() => ScopedModelDescendant<MajorViewModel>(
          builder: (BuildContext context, Widget? child, MajorViewModel model) {
        return ListView.builder(
          itemCount: model.majors.length,
          itemBuilder: (context, index) {
            return MajorItem(
              major: model.majors[index],
              onClick: (major) => showEditDialog(context, model, major: major),
              onDelete: (major) => model.delete(major),
            );
          },
        );
      });
  final majorNameController = TextEditingController();
  Future<void> showEditDialog(var context, MajorViewModel model,
      {Major? major}) async {
    major ??= Major(name: '');
    majorNameController.text = major.name;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter major name'),
          content: TextField(
            controller: majorNameController,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                major!.name = majorNameController.text.trim();
                model.save(major);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
