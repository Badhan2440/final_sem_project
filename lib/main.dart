import 'package:final_sem_project/item_details.dart';
import 'package:final_sem_project/screens/home_screen.dart';
import 'package:final_sem_project/screens/login_screen.dart';
import 'package:final_sem_project/screens/main_page.dart';
import 'package:final_sem_project/screens/registration_screen.dart';
import 'package:final_sem_project/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dashbord_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBBvllGg0nPAM9J0DHfUlTVgKV0pIhZDvc", // Your apiKey
      appId: "1:1094324644598:android:2701130e926ea0d3469ad7", // Your appId
      messagingSenderId: "1094324644598", // Your messagingSenderId
      projectId: "telemedicine-b1b99", // Your projectId
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telemedicine',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ItemDetailsPage(),
    );
  }
}