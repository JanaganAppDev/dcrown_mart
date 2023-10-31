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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: AssetImage('assets/fruits.png'),
                        ),
                        SizedBox(height: 4.0),
                        Text('grocery'),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "crown super deals",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 180.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'dishwash.jpeg',
                          height: 100.0,
                          width: 100.0,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "DISHWASH LIQUID",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs150",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 29.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor: Colors.yellow[700],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 180.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'dishwash.jpeg',
                          height: 100.0,
                          width: 100.0,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "DISHWASH LIQUID",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs150",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 29.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor: Colors.yellow[700],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New Products",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 180.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'dishwash.jpeg',
                          height: 100.0,
                          width: 100.0,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "DISHWASH LIQUID",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs150",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 29.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor: Colors.yellow[700],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
