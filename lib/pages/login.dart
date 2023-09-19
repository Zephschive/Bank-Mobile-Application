// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_element

import 'dart:math';

//import 'package:bank2/models/user_model.dart';
import 'package:bank2/models/auth.dart';
import 'package:bank2/pages/buttonNav.dart';
import 'package:bank2/models/user_model.dart';
import 'package:bank2/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'wallet.dart';
import 'package:bank2/pages/signup.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool isLogin = true;
  final TextEditingController Email = TextEditingController();
  final TextEditingController idNumberController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: LayoutBuilder(
          builder: (context, size) {
            return SizedBox(
              width: size.maxWidth,
              height: size.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 5),
                        color: Colors.black,
                        child: Text(
                          "ASTRA",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "BANK",
                        style: TextStyle(
                            fontSize: 30, 
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "LOGIN PAGE",
                    style:
                        TextStyle(fontSize: 20,
                         fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    child: TextField(
                      controller: Email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        hintText: "ID NUMBER"
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    child: TextField(
                    controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password"
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                       Auth().signwithEmailandPass(email: Email.text, password: passwordController.text);

                      
                    
                      Navigator.push(context, 
                      MaterialPageRoute(builder:(context) =>homepage())) ;
                        
                       
                    },
                    style: TextButton.styleFrom(
                        minimumSize: Size(size.maxWidth / 2, 50),
                        backgroundColor: Colors.black),
                    child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ))),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return signup();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Don't have an Account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.underline)),
                    )
                 ),
              
              
            
              ],
              ),
            );
          
          }
  
        ),
        
        
    );
  }
}
    