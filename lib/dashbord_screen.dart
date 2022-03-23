import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'item_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {

    Size size= MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.notifications_rounded,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(''),
            ),
          )
        ]
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              child: Text(
                "Hi Paul",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,left: 20),
              child: Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0,2),
                    blurRadius: 5,
                    spreadRadius: 0,
                  )
                ]
              ),
              height: 60,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        maxLines: 1,
                        autofocus: false,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Icon(
                            Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              width: size.width,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      "Catagory",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),


            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20,left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCatagories('assets/tooth.png',"Tooth","10 Doctors"),
                  demoCatagories('assets/brain.png',"Brain","10 Doctors"),
                  demoCatagories('assets/heart.png',"Heart","10 Doctors"),
                  demoCatagories('assets/bone.png',"Bone","10 Doctors"),
                  demoCatagories('assets/tooth.png',"eyes","10 Doctors"),
                  demoCatagories('assets/tooth.png','Skin',"10 Doctors"),
                  

                  
                ],
              ),
            ),








            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              width: size.width,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      "Top Rated",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            
            
            
            
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(" ","Dr. Jahangir Alam","Heart Surgeon","4.1"),
                    demoTopRatedDr(" ","Dr. Sakib Al Hasan","Eye Surgeon","4.2"),
                    demoTopRatedDr(" ","Dr. Mushfiqur rahim","Skin Surgeon","4.3"),
                    demoTopRatedDr(" ","Dr. Nasir","Nuro Surgeon","4.4"),
                    demoTopRatedDr(" ","Dr. Al Amin","Dental Surgeon","4.5"),
                  ],
                ),

              ),
            )









          ],
        ),
      ),
    );
  }
  
  
  
  
  Widget demoCatagories(String image, String name, String drQuality){
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(image),
          ),



          Container(
            margin: EdgeInsets.only(top: 13),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white30,
            ),
            child: Text(
              drQuality,
              style: TextStyle(
                  color: Colors.black,
                  fontSize:10,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),



        ],
      ),
    );

  }




  Widget demoTopRatedDr(String image, String name,String speciality, String rating){
    Size size= MediaQuery.of(context).size;


    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemDetailsPage()));
      },
      child: Container(
        height: 90,
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 98,width: 50,
                child: Image.asset(image),
              ),
              Container(
                margin: EdgeInsets.only(left:20,top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),



                    Container(
                      margin: EdgeInsets.only(top: 10,),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              speciality,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 3,left: size.width*0.25),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Rating: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    rating,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

}
