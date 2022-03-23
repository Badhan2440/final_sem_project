import 'package:final_sem_project/components/card_catagory.dart';
import 'package:final_sem_project/components/card_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'h1.png',
                      width: 50,
                    ),
                    SizedBox(height: 5,),
                    Text("Find a medicine or\nvitamins with ELDOC",
                      style: TextStyle(fontSize: 15, color: Colors.white) ,
                    )
                  ],
                ),
                IconButton(
                    onPressed:(){},
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.redAccent,
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search medicine...",
                  hintStyle: TextStyle(color: Colors.black)
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text("Medicine & Services by Catagory",
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
            CardCatagory(imageCatagory: "assets/vitamins.png", nameCatagory: 'VITAMINS',),
          ],
        ),
      )
    );
  }
}

