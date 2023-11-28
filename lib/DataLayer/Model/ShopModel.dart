import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';

class ShopModel extends Shop {
  ShopModel(
      {required super.name,
      required super.price,
      required super.descrption,
      required super.imagePath});

  factory ShopModel.fromJson(jsonData) {
    return ShopModel(
        name: jsonData['title'],
        price: jsonData['price'],
        descrption: jsonData['description'],
        imagePath: jsonData['image']);
  }
}
