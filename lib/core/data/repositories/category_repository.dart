import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/features/categories/data/category_model.dart';

class CategoryRepository {
  static List<Map<String, dynamic>> _categories = [];
  static Future<List<CategoryModel>> getCategoriesOfSpecificSection(
      {required int sectionId}) async {
    _categories =
        await DBHelper.getCategoriesOfSpecificSection(sectionId: sectionId);
    return _categories
        .map((category) => CategoryModel.fromJson(category))
        .toList()
        .cast<CategoryModel>();
  }
}
