import 'package:bank2/pages/login.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 5),
              color: Colors.white,
              child: Text(
                "ASTRA",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Text(
              "BANK",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
          
          
          
          ],
        ),
      ),
      ),
      body: ListView(children: [
        Container(
          height: 34,
          width: 253,
          margin: EdgeInsets.only(
            left: 46,
            right: 61,
            top: 23,
          ),
          child: Center(
            child: Text(
              "TRANSFER MONEY",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: "Tomorrow",
              ),
            ),
          ),
        ),
        Container(
          height: 115,
          width: 57,
          margin: EdgeInsets.only(left: 15, right: 30, top: 20),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(237, 73, 14, 224),
                ),
                hintText: "TO:"),
          ),
        ),
        Container(
          height: 315,
          width: 57,
          margin: EdgeInsets.only(
            left: 15,
            right: 30,
            
          ),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.attach_money_sharp,
                  color: Color.fromARGB(237, 73, 14, 224),
                ),
                hintText: "AMOUNT"),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 23,
            left: 79,
            right: 83,
          ),
          height: 51,
          width: 198,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(237, 73, 14, 224),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
            child: Text(
              "TRANSFER",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: "Tomorrow",
              ),
            ),
          ),
        ),
      ]),
    );;
  }
}