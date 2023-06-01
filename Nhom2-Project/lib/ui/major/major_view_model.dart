import 'package:doan/model/major.dart';
import 'package:doan/utils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';

class MajorViewModel extends Model {
  static final MajorViewModel _instance = MajorViewModel._internal();
  factory MajorViewModel() => _instance;
  MajorViewModel._internal() {
    updateList();
  }

  List<Major> majors = [];
  void updateList() async {
    final results = await AppVariables.api.getMajors();
    majors = results.data ?? [];
    notifyListeners();
  }

  void save(Major major) async {
    major.id == 0
        ? await AppVariables.api.addMajor(major)
        : await AppVariables.api.updateMajor(major.id, major);
    updateList();
  }

  void delete(Major major) async {
    await AppVariables.api.deleteMajor(major.id);
    updateList();
  }
}
