import 'package:bank2/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin:  EdgeInsets.only(right: 5),
              color: Colors.white,
              child: Text(
                "ASTRA",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Text("BANK",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal
            )
            )
          ],
        ),
      ),
      body: ListView(children: [
        Container(
          height: 34,
          width: 253,
          margin: EdgeInsets.only(left: 46, right: 61, top: 23),
          child: Center(
            child: Text("SETTINGS",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: "Tomorrow",
            ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 23, right: 17),
          height: 59,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[900]
),
      child: TextButton(onPressed: () {FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginPage();} )));}, child: Center(
        child: Text(
          "SIGNOUT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
            fontFamily: "Tomorrow",
          ),
        ),
      ) ,),
        )
      ]),
    );
  }
}