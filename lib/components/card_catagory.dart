import 'package:flutter/material.dart';

class CardCatagory extends StatelessWidget {
  final String imageCatagory;
  final String nameCatagory;

  CardCatagory({required this.imageCatagory, required this.nameCatagory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageCatagory,
          width: 65,
        ),
        SizedBox(height: 10,),
        Text(nameCatagory, style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ],
    );
  }
}
