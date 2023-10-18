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

  static void addCategory(
      {required String name,
      required String imagePath,
      required int sectionid}) async {
    await DBHelper.insertIntoCategory(
        sectionid: sectionid, name: name, image: imagePath);
  }

  static Future<CategoryModel> getCategoryByName({required String name}) async {
    _data = await DBHelper.getCategoryByName(name: name);
    return CategoryModel.fromJson(_data[0]);
  }
}
