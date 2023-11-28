import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const MyButton({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.grey[300]),
        child: Center(child: child),
      ),
    );
  }
}
