
import 'package:final_sem_project/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dashbord_screen.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Form key
  final _formKey= GlobalKey<FormState>();



  //editing controller
  final TextEditingController emailController= new TextEditingController();
  final TextEditingController passwordController= new TextEditingController();


  //firebase
  final _auth= FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    //email field
    final emailField= TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text=value!;
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




    //password field
    final passwordField= TextFormField(
      autofocus: false,
      controller: passwordController,
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
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,color: Colors.redAccent,),
          contentPadding: EdgeInsets.fromLTRB(28, 15, 20, 15),
          hintText: "Password", hintStyle: TextStyle(color: Colors.white24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
    );



    final loginButton= Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
          ),
        ),
      ),


    );





    return Scaffold(
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
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      )
                    ),

                    SizedBox(height: 45,),

                    emailField ,
                    SizedBox(height: 12,),
                    passwordField,
                    SizedBox(height: 35,),
                    loginButton,
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?", style: TextStyle(color: Colors.white),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                          },
                          child: Text(
                            " Signup",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,fontSize:15


                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
            ),
            
            ),
          ),

        )
      ),

    );
  }





  // ***********   LOGIN FUBCTION   ***************
  void signIn(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Dashboard())),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
