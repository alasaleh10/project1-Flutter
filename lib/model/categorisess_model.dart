class CategorisessModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;

  CategorisessModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
  });

  factory CategorisessModel.fromJson(Map<String, dynamic> json) {
    return CategorisessModel(
      categoriesId: int.tryParse(json['categories_id'].toString()),
      categoriesName: json['categories_name']?.toString(),
      categoriesImage: json['categories_image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (categoriesId != null) 'categories_id': categoriesId,
        if (categoriesName != null) 'categories_name': categoriesName,
        if (categoriesImage != null) 'categories_image': categoriesImage,
      };
}
