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
   /*   body: GridView.count(crossAxisCount: 1,crossAxisSpacing: 5.0,mainAxisSpacing: 15.0,


      children: List.generate(4, (index) => card(index: index)),

      ),*/

      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Container(
              color: colorPrimary,
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
                                backgroundImage:
                                AssetImage('assets/grocery icon.png'),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'grocery',
                              style: TextStyle(color: colorWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 15.0),
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
            Container(
              height:400,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2, ),
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    // height: 200.0,
                    // width: 150.0,
                    child: Stack(
                      children: [
                        Container(
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
                          // height: 185.0,
                          // width: 140.0,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            addedToCart1 = !addedToCart1; // Toggle the state
                                          });
                                        },
                                        child: Center(
                                          child: Icon(
                                            addedToCart1
                                                ? Icons.remove_circle
                                                : Icons.add_circle,
                                            color: addedToCart1
                                                ? colorWhite
                                                : colorWhite,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(5, 5),
                                          backgroundColor: addedToCart1
                                              ? Colors.red
                                              : Colors.yellow,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
            ),

          ],
        ),
      ),
    );
  }
}
/*class card extends StatefulWidget {
  const card({required this.index, super.key});
   final int index;
  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:8.0),
      child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Container(
                            width: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  addedToCart1 = !addedToCart1; // Toggle the state
                                });
                              },
                              child: Center(
                                child: Icon(
                                  addedToCart1
                                      ? Icons.remove_circle
                                      : Icons.add_circle,
                                  color: addedToCart1
                                      ? colorWhite
                                      : colorWhite,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(5, 5),
                                backgroundColor: addedToCart1
                                    ? Colors.red
                                    : Colors.yellow,
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
            Padding(
              padding: EdgeInsets.only(top: 148.0),
              child: Positioned(
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
            ),
          ],
        ),
      ),
    );
  }
}*/

