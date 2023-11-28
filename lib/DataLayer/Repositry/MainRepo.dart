import 'package:shop_prototypee/DataLayer/Drc/DataSource.dart';
import 'package:shop_prototypee/DataLayer/Model/ShopModel.dart';
import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';
import 'package:shop_prototypee/DomainLayer/RAbstractRepositry/AbsRepo.dart';

class MainRepo implements AbstractRepo {
  final AbsRemoteDataSource _absRemoteDataSource;

  MainRepo(this._absRemoteDataSource);

  @override
  void AddtoCart(Shop item) {
    ShopModel model = ShopModel(
        name: item.name,
        price: item.price,
        descrption: item.descrption,
        imagePath: item.imagePath);
    _absRemoteDataSource.AddProduct(model);
  }

  @override
  void RemoveCart(Shop item) {
    ShopModel model = ShopModel(
        name: item.name,
        price: item.price,
        descrption: item.descrption,
        imagePath: item.imagePath);

    _absRemoteDataSource.RemoveProduct(model);
  }

  @override
  List<Shop> getCart() {
    return _absRemoteDataSource.GetCartList();
  }

  @override
  Future<List<Shop>> getProductsList() async {
    return await _absRemoteDataSource.GetProducstList();
  }
}
