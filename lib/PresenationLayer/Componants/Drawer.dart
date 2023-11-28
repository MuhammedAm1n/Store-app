// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop_prototypee/PresenationLayer/Componants/ListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
//Drawer logo

          Column(
            children: [
              DrawerHeader(
                  child: Center(
                      child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Colors.black,
              ))),
              SizedBox(
                height: 25,
              ),
//shop title
              MyListTile(
                  text: "Store",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                  }),

//cart title
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pushNamed(context, '/ThirdPage');
                  }),
            ],
          ),
//exit shop

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(text: "Exit", icon: Icons.logout, onTap: () {}),
          ),
        ],
      ),
    );
  }
}
