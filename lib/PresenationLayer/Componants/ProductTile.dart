import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_prototypee/DomainLayer/Entity/shopEntity.dart';
import 'package:shop_prototypee/DomainLayer/UseCase/UseCaseShop.dart';

class ProductTile extends StatelessWidget {
  final Shop product;
  const ProductTile({super.key, required this.product});

//Add to cart

  void AddtoCart(BuildContext context) {
// show dialog box to ask user to confirm to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('Add this item to your cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/ThirdPage');
                    //add to cart
                    context.read<UseCaseShop>().AddtoCart(product);
                  },
                  child: Text('Add'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(10),
      width: 300,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//product Image

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.network(product.imagePath)),
            ),

            SizedBox(
              height: 25,
            ),

// Product Name

            Text(
              product.name.substring(0, 18),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

// Product Descrption

            Text(
              product.descrption.substring(0, 80),
            ),

            SizedBox(
              height: 25,
            ),
          ],
        ),

// Product Price + Add button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${product.price}' + ' \$',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            IconButton(
                onPressed: () {
                  AddtoCart(context);
                },
                icon: Icon(Icons.add)),
          ],
        )
      ]),
    );
  }
}
