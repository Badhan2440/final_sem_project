import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String imageProduct;
  final String nameProduct;
  final String price;

  CardProduct({required this.imageProduct,required this.nameProduct,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(imageProduct, width: 115,height: 76,),
          SizedBox(height: 16,),
          Text(nameProduct, style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
          SizedBox(height: 14,),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
