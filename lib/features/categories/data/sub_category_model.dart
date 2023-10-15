class SubCategoryModel {
  final int id;
  final String name;
  final String image;
  final int categoryId;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categoryId: json['categoryid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'categoryid': categoryId,
    };
  }
}
