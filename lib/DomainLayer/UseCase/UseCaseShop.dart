import 'package:flutter/material.dart';
import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';
import 'package:shop_prototypee/DomainLayer/RAbstractRepositry/AbsRepo.dart';

class UseCaseShop extends ChangeNotifier {
  final AbstractRepo _repo;

  UseCaseShop({required AbstractRepo repo}) : _repo = repo;

  Future<List<Shop>> UsegetProductsList() async {
    return await _repo.getProductsList();
  }

  List<Shop> getCart() {
    return _repo.getCart();
  }

  void AddtoCart(Shop item) {
    _repo.AddtoCart(item);
    notifyListeners();
  }

  void RemoveCart(Shop item) {
    _repo.RemoveCart(item);
    notifyListeners();
  }
}
