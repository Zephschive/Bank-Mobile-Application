// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_element

import 'dart:math';

import 'package:bank2/models/auth.dart';
import 'package:bank2/models/user_model.dart';
import 'package:bank2/pages/login.dart';


import 'package:flutter/material.dart';

import 'homepage.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final Email = TextEditingController();
  final idNumberController = TextEditingController(); 
  final passwordController = TextEditingController();
  
  
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
                    "SIGNUP PAGE",
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
                    child: TextField(
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


                     var newUser=UserModel(
                        id: Random().nextInt(1000).toString(),
                       idNumber: Email.text,
                        password: passwordController.text,
                        );
                     newUser.saveUser();
                     Auth().CreateAccountWithEmailAndPassword(Email: Email.text, Password: passwordController.text);
                     
                       Navigator.push(context, 
                      MaterialPageRoute(builder:(context) =>homepage()));
                     
                    
                     
                    },
                    style: TextButton.styleFrom(
                        minimumSize: Size(size.maxWidth / 2, 50),
                        backgroundColor: Colors.black),
                    child: Text("SIGNUP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ))),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return LoginPage();
                    })
                      );
                      },
                    
        
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Already Have An Account?",
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
    