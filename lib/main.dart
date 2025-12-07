//import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:Image.asset('pics/profilepic.png').image,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Adnan',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'IT Specialist',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email:'),
                  Text('adnan78@example.com'),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone:'),
                  Text('7846465748'),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}