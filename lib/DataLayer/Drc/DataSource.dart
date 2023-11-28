import 'dart:convert';

import 'package:shop_prototypee/DataLayer/Model/ShopModel.dart';
import 'package:http/http.dart' as http;

abstract class AbsRemoteDataSource {
  Future<List<ShopModel>> GetProducstList();
  List<ShopModel> GetCartList();
  void RemoveProduct(ShopModel item);
  void AddProduct(ShopModel item);
}

class RemoteDataSource implements AbsRemoteDataSource {
  List<ShopModel> Products = [];
  List<ShopModel> ProductsCart = [];

  @override
  void AddProduct(ShopModel item) {
    ProductsCart.add(item);
  }

  @override
  List<ShopModel> GetCartList() {
    return ProductsCart;
  }

  @override
  Future<List<ShopModel>> GetProducstList() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // Decode Map to Lists and Get very Index in list and save it to Products List
    List<dynamic> data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      Products.add(
        ShopModel.fromJson(data[i]),
      );
    }
    return Products;
  }

  @override
  void RemoveProduct(ShopModel item) {
    ProductsCart.remove(item);
  }
}
