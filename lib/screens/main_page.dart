import 'package:final_sem_project/screens/profile_page.dart';
import 'package:flutter/material.dart';

import 'history_page.dart';
import 'home_screen.dart';




class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectIndex=0;

  final _pageList= [
    HomePage(), HistoryPage(), ProfilePage(),
  ];

  onTappedItem(int index){
    setState(() {
      _selectIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pageList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Account"),
          ],
        currentIndex: _selectIndex,
        onTap: onTappedItem,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}


