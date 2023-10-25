import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text("My App"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("johndoe@example.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("My Orders"),
              leading: Icon(Icons.shopping_cart),
              onTap: () {},
            ),
            ListTile(
              title: Text("My Address"),
              leading: Icon(Icons.location_on),
              onTap: () {},
            ),
            ListTile(
              title: Text("Feedback"),
              leading: Icon(Icons.lightbulb),
              onTap: () {},
            ),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.chat_outlined),
              onTap: () {},
            ),
            ListTile(
              title: Text("Share"),
              leading: Icon(Icons.share),
              onTap: () {},
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Main content goes here"),
      ),
    );
  }
}
