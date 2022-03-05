import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_sem_project/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth= FirebaseAuth.instance;

  //form Key
  final _formKey= GlobalKey<FormState>();

  //editing controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();




  @override
  Widget build(BuildContext context) {



    //************  First name field   *********
    final firstNameField= TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex= new RegExp(r'^.{4,}$');
        if(value!.isEmpty){
          return("First name cannot be empty");
        }
        if(!regex.hasMatch(value)){
          return("Please enter valid name(Max 20 Character)");
        }
      },
      onSaved: (value){
        firstNameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle,
            color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "First name",hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );



    //***********   second name field   **********
    final secondNameField= TextFormField(

      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex= new RegExp(r'^.{4,}$');
        if(value!.isEmpty){
          return("Second name cannot be empty");
        }
        if(!regex.hasMatch(value)){
          return("Please enter valid surname(Max 20 Character)");
        }
        return null;
      },
      onSaved: (value){
        secondNameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "Second name",hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );




    // ***********  email field  ***********
    final emailField= TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Please Enter your Email");
        }
        //reg expression
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0=9.-]+.[a-z]").hasMatch(value)){
          return("Please enter a valid Email address");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "Email",hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );




    //***********  password field   ***********
    final passwordField= TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value){
        RegExp regex= new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("Password is required for login");
        }
        if(!regex.hasMatch(value)){
          return("Please enter valid password(Min 6 Character)");
        }
      },
      onSaved: (value){
        passwordEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key_outlined, color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "Password",hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );




    //************   confirm password field   ******
    final confirmPasswordField= TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmPasswordEditingController.text!= passwordEditingController.text){
          return "Password doesn't match";
        }
        return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text=value!;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "Confirm password",hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );



    //***********      sign up button  ************
    final signUpButton= Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "SIGN UP",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );





    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.redAccent),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )
                    ),

                    SizedBox(height: 45,),
                    firstNameField ,
                    SizedBox(height: 12,),
                    secondNameField,
                    SizedBox(height: 12,),
                    emailField ,
                    SizedBox(height: 12,),
                    passwordField ,
                    SizedBox(height: 12,),
                    confirmPasswordField ,
                    SizedBox(height: 30,),
                    signUpButton,

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }




  void signUp(String email, String password) async{
    if(_formKey.currentState!. validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });

    }
  }




  postDetailsToFirestore() async{
    FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    User? user= _auth.currentUser;

    UserModel userModel= UserModel();

    userModel.email= user!.email;
    userModel.uid= user!.uid;
    userModel.firstName= firstNameEditingController.text;
    userModel.secondName= secondNameEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully :)");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);

  }
}

