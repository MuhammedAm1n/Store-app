import 'package:flutter/material.dart';
import 'package:shop_prototypee/PresenationLayer/Componants/Button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
            ),
            SizedBox(
              height: 20,
            ),
            Text('ProtoType Store',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 10),
            Text(
              'share happines not Xx',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
                child: Icon(Icons.arrow_forward),
                onTap: () => Navigator.pushNamed(context, '/SecondPage')),
          ],
        ),
      ),
    );
  }
}
