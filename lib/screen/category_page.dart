import 'package:flutter/material.dart';

import '../const.dart';

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
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color:  colorPrimary,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        /*BoxShadow(
                          color: colorGrey,
                          blurRadius: 9.0,
                          offset: Offset(0, 0),
                        ),*/
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('assets/grocery icon.png'),
                        ),
                        SizedBox(height: 4.0),
                        Text('grocery',style:TextStyle(color: colorWhite) ,),
                      ],
                    ),

                  );

                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "crown super deals",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: colorGrey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 182.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color:toolbar,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          "25%",
                          style: TextStyle(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
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
                            color: notificationTitle,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs 150",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 27.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor: golden,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Text(
                        "View All ",
                        style: TextStyle(
                          color: notificationTitle,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,  // Replace with your desired icon
                        color: Colors.black,
                      ),
                    ],
                  ),
                )


              ],
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child:Container(
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color:colorGrey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 182.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color:toolbar,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          "25%",
                          style: TextStyle(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
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
                            color: notificationTitle,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs 150",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: colorPrimaryDark ,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 27.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor:golden ,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )

            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Prodducts",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Text(
                        "View All ",
                        style: TextStyle(
                          color: notificationTitle,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,  // Replace with your desired icon
                        color: notificationTitle,
                      ),
                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: colorGrey,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 180.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color:  toolbar,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          "25%", // Replace with your desired percentage
                          style: TextStyle(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
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
                            color: notificationTitle,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          children: [
                            Text(
                              "Rs 150",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color:  colorPrimaryDark,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 27.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(5, 5),
                                  backgroundColor: golden,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
              ,
            ),
          ],
        ),
      ),
    );
  }
}