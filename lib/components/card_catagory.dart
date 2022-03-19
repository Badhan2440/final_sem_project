import 'package:flutter/material.dart';

class CardCatagory extends StatelessWidget {
  late final String imageCatagory;
  late final String nameCatagory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/vitamins.png",
          width: 65,
        ),
        SizedBox(height: 10,),
        Text("Vitamins",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
