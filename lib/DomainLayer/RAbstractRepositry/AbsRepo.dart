import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';

abstract class AbstractRepo {
  Future<List<Shop>> getProductsList();
  List<Shop> getCart();
  void AddtoCart(Shop item);
  void RemoveCart(Shop item);
}
