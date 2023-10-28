import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.yellow,
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          height: 150.0,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 8.0), // Add space between CircleAvatar and text
                      Text(
                        'grocery',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
