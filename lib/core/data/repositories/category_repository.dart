import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/features/categories/data/category_model.dart';
import 'package:masaref/features/categories/data/sub_category_model.dart';

class CategoryRepository {
  static List<Map<String, dynamic>> _data = [];
  static Future<List<CategoryModel>> getCategoriesOfSpecificSection(
      {required int sectionId}) async {
    _data = await DBHelper.getCategoriesOfSpecificSection(sectionId: sectionId);
    return _data
        .map((category) => CategoryModel.fromJson(category))
        .toList()
        .cast<CategoryModel>();
  }

  static Future<List<SubCategoryModel>> getSubCategoriesOfSpecificCategory(
      {required int categoryId}) async {
    _data = await DBHelper.getSubCategoriesOfSpecificCategory(
        categoryId: categoryId);
    return _data
        .map((subCategory) => SubCategoryModel.fromJson(subCategory))
        .toList()
        .cast<SubCategoryModel>();
  }

  static void addCategoryOrSubCategory(
      {required bool isCategory,
      required String name,
      required String imagePath,
      required int id}) async {
    if (isCategory) {
      await DBHelper.insertIntoCategory(
          sectionid: id, name: name, image: imagePath);
    } else {
      await DBHelper.insertIntoSubCategory(
          categoryid: id, name: name, image: imagePath);
    }
  }
}
