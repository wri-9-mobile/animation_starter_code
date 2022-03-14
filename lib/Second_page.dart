import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Hero(
              tag: 'kotak',
              child: Container(
                width: double.infinity,
                height: 400,
                color: Colors.red,
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: pi * 2),
              duration: Duration(seconds: 1),
              builder: (context, double value, _) {
                return Transform.rotate(
                  angle: value,
                  child: Icon(
                    Icons.account_tree,
                    size: 64,
                  ),
                );
              }),
          TweenAnimationBuilder<Color>(
              tween: Tween(begin: Colors.red, end: Colors.blue),
              duration: Duration(seconds: 1),
              builder: (__, Color value, ___) {
                return Container(
                  height: 200,
                  width: 200,
                  color: value,
                );
              })
          //
        ],
      ),
    );
  }
}
