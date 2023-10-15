class CategoryModel {
  final int id;
  final int sectionId;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.sectionId,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      sectionId: json['sectionid'],
      name: json['name'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sectionid': sectionId,
      'name': name,
      'image': image,
    };
  }
}
