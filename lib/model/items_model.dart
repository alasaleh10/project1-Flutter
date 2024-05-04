class ItemsModel {
  int? itemsId;
  String? itemsName;
  int? itemsPrice;
  String? itemsDes;
  String? itemsImage;
  int? idCategoris;

  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsPrice,
    this.itemsDes,
    this.itemsImage,
    this.idCategoris,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        itemsId: int.tryParse(json['items_id'].toString()),
        itemsName: json['items_name']?.toString(),
        itemsPrice: int.tryParse(json['items_price'].toString()),
        itemsDes: json['items_des']?.toString(),
        itemsImage: json['items_image']?.toString(),
        idCategoris: int.tryParse(json['id_categoris'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (itemsId != null) 'items_id': itemsId,
        if (itemsName != null) 'items_name': itemsName,
        if (itemsPrice != null) 'items_price': itemsPrice,
        if (itemsDes != null) 'items_des': itemsDes,
        if (itemsImage != null) 'items_image': itemsImage,
        if (idCategoris != null) 'id_categoris': idCategoris,
      };
}
