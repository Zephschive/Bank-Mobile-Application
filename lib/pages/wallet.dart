// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bank2/config.dart';
import 'package:bank2/models/user_model.dart';
import 'package:hive_flutter/adapters.dart'; 


class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  final User =FirebaseAuth.instance.currentUser;
    TextEditingController idNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
      child: LayoutBuilder(builder: (context, size) {
        return ValueListenableBuilder<Box<UserModel>>(
            valueListenable: LocalDB.userBox.listenable(),
            builder: (context, box, child) {
              var users = box.values.toList();
              return Column(
                children: [
                  Text(
                    "Welcome,"+User!.email.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: size.maxWidth,
                    height: size.maxHeight / 4,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                     
                        Positioned(
                            left: 20,
                            bottom: 20,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            )),
                     
                        Positioned(
                            left: 20,
                            bottom: 55,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            )),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child:
                              Image.asset(
                            "assets/images/vi.png",
                            height: 23,
                            width: 75,
                          ),
                        ),
                        //Visa Image
                     
                       
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "ACCOUNT BALANCE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              Text("GHS 10,000",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 27)),
                                      
                            ]),
                            
                      ],
                    ),
                  ),
                  Center(child: Text("Users",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),),

                 // Image.asset("assets/images/vi.png"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                        //  print(users[index].password);
                          return ListTile(
                            title: Text(users[index].idNumber,),
                            subtitle: Text(users[index].password),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){
                                    idNumberController.text= users[index].idNumber;
                                  passwordController.text= users[index].password;
                                    showModalBottomSheet(context: context, 
                                    builder: (context){
                            return Container(
                              color:Colors.white,
                              height: 1200,
                              width: 120/4,
                              
                              child: Column(
                                
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10,top: 20),
                                    alignment:Alignment.topLeft ,
                                    child: Text("ID Number ", style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20
                                    ),),
                                  ),
                                  //idNumber textfield
                                   Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 150),
                                    child: TextFormField(
                                       
                                      controller: idNumberController,
                                      ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10,top: 50),
                                    alignment:Alignment.topLeft ,
                                    child: Text("Password ", style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20
                                    ),),
                                  ),
                                  //password textfield
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 150),
                                    child: TextFormField(
                                       
                                      controller: passwordController,
                                      ),
                                  ),
                                  SizedBox(height: 50,),
                                  ElevatedButton(onPressed: (){
                                    users[index].updateUser(
                                   idNumber: idNumberController.text,
                                      password: passwordController.text,
                                   );
                                    Navigator.pop(context);
                                  }, child: Text("Update"))
                                ],
                              ),
                            );
                                    });
                                  }, icon: Icon(Icons.edit)),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: (){
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text("Delete Item"),
                                          content: Text("Are you sure you want to delete this item"),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text("No")),
                                            TextButton(onPressed: (){
                                              users[index].deleteUser();
                                              Navigator.pop(context);
                                              },child: Text("Yes"),)
                                          ],
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
            });
      }),
    )
    
    );
     
  }
  
  }
