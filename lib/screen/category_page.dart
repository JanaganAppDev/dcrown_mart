import 'package:dcrown_mart/screen/viewall_page.dart';
import 'package:flutter/material.dart';
import '../const.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

List<bool> addedToCart = [false , false , false, false];
List<bool> addedToCart2 = [false , false , false, false,false];
List<bool> addedToCart3 = [false , false , false, false,false];

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      /*   body: GridView.count(crossAxisCount: 1,crossAxisSpacing: 5.0,mainAxisSpacing: 15.0,


      children: List.generate(4, (index) => card(index: index)),

      ),*/

      body: SingleChildScrollView(
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Crown Super Deals",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 250.0,
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    /* //height: 120.0,
                     width: 130.0,*/
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
                              Center(
                                child: Image.asset(
                                  'dishwash.jpeg',
                                  height: 130.0,
                                  width: 130.0,
                                  alignment: Alignment.center,
                                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              addedToCart[index] = !addedToCart[index];
                                            });
                                          },
                                          child: Center(
                                            child: Icon(
                                              addedToCart[index]
                                                  ? Icons.remove_circle
                                                  : Icons.add_circle,
                                              color: colorWhite,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                              ),
                                            ),
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                            ),
                                            padding: EdgeInsets.all(12.0),
                                            backgroundColor: addedToCart[index]
                                                ? colorRed
                                                : colorPrimary,
                                          ),
                                        )),
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular products",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewallPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "view all",
                            style: TextStyle(
                              color: colorGrey1,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,color: colorGrey1,size: 12.0),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250.0,
                //width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemExtent: 230.0,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          /* //height: 120.0,
                       width: 130.0,*/
                          child: Stack(
                            children: [
                              Container(
                                width: 200.0,
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
                                    Center(
                                      child: Image.asset(
                                        'dishwash.jpeg',
                                        height: 130.0,
                                        width: 130.0,
                                        alignment: Alignment.center,
                                      ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    addedToCart2[index] = !addedToCart2[index];
                                                  });
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    addedToCart2[index]
                                                        ? Icons.remove_circle
                                                        : Icons.add_circle,
                                                    color: colorWhite,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10.0),
                                                      bottomRight:
                                                      Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  padding: EdgeInsets.all(12.0),
                                                  backgroundColor: addedToCart2[index]
                                                      ? colorRed
                                                      : colorPrimary,
                                                ),
                                              )),
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New products",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewallPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "view all",
                            style: TextStyle(
                              color: colorGrey1,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,color: colorGrey1,size: 12.0),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250.0,
                //width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemExtent: 230.0,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          /* //height: 120.0,
                       width: 130.0,*/
                          child: Stack(
                            children: [
                              Container(
                                width: 200.0,
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
                                    Center(
                                      child: Image.asset(
                                        'dishwash.jpeg',
                                        height: 130.0,
                                        width: 130.0,
                                        alignment: Alignment.center,
                                      ),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              decoration:
                                              TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Container(
                                              width: 40,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    addedToCart3[index] = !addedToCart3[index];
                                                  });
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    addedToCart3[index]
                                                        ? Icons.remove_circle
                                                        : Icons.add_circle,
                                                    color: colorWhite,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10.0),
                                                      bottomRight:
                                                      Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  padding: EdgeInsets.all(12.0),
                                                  backgroundColor: addedToCart3[index]
                                                      ? colorRed
                                                      : colorPrimary,
                                                ),
                                              )),
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
