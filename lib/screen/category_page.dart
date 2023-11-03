import 'package:flutter/material.dart';

import '../const.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

bool addedToCart1 = false;
bool addedToCart2 = false;
bool addedToCart3 = false;


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
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: colorBlack,
                                    blurRadius: 8.0,
                                    spreadRadius: -5.4,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/grocery icon.png'),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text('grocery',style:TextStyle(color: colorWhite) ,),
                          ],
                        ),
                      ),
                    ],
                  );

                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Row(
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
            ),
            SizedBox(height: 20.0),
            ListView.builder(
                 itemCount: 10,
                 itemBuilder: (context, index) {
                   return Container(
                     height: 190.0,
                     width: 150.0,
                     child: Stack(
                       children: [
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
                             height: 185.0,
                             width: 140.0,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Image.asset(
                                   'dishwash.jpeg',
                                   height: 130.0,
                                   width: 130.0,
                                   alignment: Alignment.center,
                                 ),
                                 SizedBox(height: 4.0),
                                 Padding(
                                   padding: EdgeInsets.only(left: 10.0),
                                   child: Text(
                                     "DISHWASH LIQUID",
                                     style: TextStyle(
                                       fontSize: 12.0,
                                       fontWeight: FontWeight.bold,
                                       color: notificationTitle,
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 3.0),
                                 Padding(
                                   padding: EdgeInsets.only(left: 10.0),
                                   child: Row(
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
                                           fontWeight: FontWeight.bold,
                                           decoration: TextDecoration
                                               .lineThrough,
                                         ),
                                       ),

                                       Container(
                                         width: 40,
                                         child: ElevatedButton(
                                           onPressed: () {
                                             setState(() {
                                               addedToCart1 =
                                               !addedToCart1; // Toggle the state
                                             });
                                           },
                                           child: Center(
                                             child: Icon(
                                               addedToCart1
                                                   ? Icons.remove_circle
                                                   : Icons.add_circle,
                                               color: addedToCart1
                                                   ? colorWhite
                                                   : colorWhite, // Change to your desired color
                                             ),
                                           ),
                                           style: ElevatedButton.styleFrom(
                                             minimumSize: Size(5, 5),
                                             backgroundColor: addedToCart1
                                                 ? Colors.red
                                                 : Colors
                                                 .yellow, // Change to your desired color
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Positioned(
                           top: 0,
                           bottom: 0,
                           right: 0,
                           left: 0,
                           child: Align(
                             alignment: Alignment.topLeft,
                             child: SizedBox(
                               height: 20,
                               width: 35,
                               child: Container(


                                 // padding: EdgeInsets.all(5.0),
                                 decoration: BoxDecoration(
                                   color: toolbar,
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: Center(
                                   child: Text(
                                     "25%",
                                     style: TextStyle(
                                       color: colorWhite,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 12.0,
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                 },
            ),
           /* SizedBox(height: 20.0),
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
                        Icons.arrow_forward_ios,size: 12.0,
                        color: notificationTitle,
                      ) ,
                    ],
                  ),
                )


              ],
            ),
            SizedBox(height: 20.0),
            Stack(
              children: [
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'dishwash.jpeg',
                        height: 130.0,
                        width: 130.0,
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 4.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "DISHWASH LIQUID",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: notificationTitle,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
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
                                fontWeight: FontWeight.bold, // Adding this line makes the text bold.
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            SizedBox(width: 27.0),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: Container(
                                width: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      addedToCart2 = !addedToCart2; // Toggle the state
                                    });
                                  },
                                  child: Icon(
                                    addedToCart2
                                        ? Icons.remove_circle
                                        : Icons.add_circle,
                                    color: addedToCart2
                                        ? colorWhite
                                        : colorWhite, // Change to your desired color
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(5, 5),
                                    backgroundColor: addedToCart2
                                        ? Colors.red
                                        : Colors.yellow, // Change to your desired color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ),
                Positioned(
                  top: -10,
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
        ],
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
                        Icons.arrow_forward_ios,size: 12.0,
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
                          height: 130.0,
                          width: 130.0,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "DISHWASH LIQUID",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: notificationTitle,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
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
                                  fontWeight: FontWeight.bold, // Adding this line makes the text bold.
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),

                              SizedBox(width: 27.0),
                              Positioned(
                                bottom: 8.0,
                                right: 8.0,
                                child: Container(
                                       width: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        addedToCart3 = !addedToCart3; // Toggle the state
                                      });
                                    },
                                    child: Icon(
                                      addedToCart3
                                          ? Icons.remove_circle
                                          : Icons.add_circle,
                                      color: addedToCart3
                                          ? colorWhite
                                          : colorWhite, // Change to your desired color
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(5, 5),
                                      backgroundColor: addedToCart3
                                          ? Colors.red
                                          : Colors.yellow, // Change to your desired color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
              ,
            ),
*/          ],
        ),
      ),
    );
  }
}