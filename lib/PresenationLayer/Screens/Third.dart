import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';
import 'package:shop_prototypee/DomainLayer/UseCase/UseCaseShop.dart';

import 'package:shop_prototypee/PresenationLayer/Componants/Button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
// remove item from cart
  void RemoveItem(BuildContext context, Shop shop) {
    context.read<UseCaseShop>().RemoveCart(shop);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UseCaseShop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.getCart().length,
                      itemBuilder: (context, index) {
                        final item = value.getCart()[index];
                        return ListTile(
                          title: Text(item.name.substring(0, 10)),
                          subtitle: Text('${item.price}'),
                          trailing: IconButton(
                            onPressed: () {
                              RemoveItem(context, item);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  child: Text('Pay Now'),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              backgroundColor: Colors.black,
                              content: Container(
                                height: 120,
                                width: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: MyButton(
                                        onTap: () {},
                                        child: Text('Pay with Visa'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                      child: MyButton(
                                        onTap: () {},
                                        child: Text('Pay with Cash'),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        });
                  },
                ),
              )
            ]),
      ),
    );
  }
}
