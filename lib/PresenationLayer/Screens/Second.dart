import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';
import 'package:shop_prototypee/DomainLayer/UseCase/UseCaseShop.dart';
import 'package:shop_prototypee/PresenationLayer/Componants/Drawer.dart';
import 'package:shop_prototypee/PresenationLayer/Componants/ProductTile.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // access product to shop
    return Consumer<UseCaseShop>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            title: Text('XxX Store'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => Navigator.pushNamed(context, "/ThirdPage"),
                  icon: Icon(Icons.shopping_cart_checkout_outlined))
            ],
          ),
          drawer: MyDrawer(),
          body: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                'Pick from a selected list of premium products',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 550,
                child: FutureBuilder(
                    future: value.UsegetProductsList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Shop> products = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: ((context, index) {
                            final product = products[index];

                            return ProductTile(product: product);
                          }),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          )),
    );
  }
}
