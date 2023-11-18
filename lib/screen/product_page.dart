import 'package:dcrown_mart/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 350.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 80.0),
                  child: Center(
                    child: Image.asset(
                      'dishwash.jpeg',
                      height: 200.0,
                      width: 200.0,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 350.0),
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                      Positioned(
                        bottom: 6,
                        right: 2,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: colorBlack,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 400.0,
              width: screenWidth,
              decoration: BoxDecoration(
                color: colorGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                // Remove the border property to remove the border
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "DISHWASH LIQUID",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SRIMA GROUPS",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dishwash liquid with lemon fragrance and new 2x formula.",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "USE:",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.brightness_1, color: colorBlack, size: 8),
                        SizedBox(width: 5),
                        Text(
                          "Take 1tsp (3.75ml) of Liquid,",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.brightness_1, color: colorBlack, size: 8),
                        SizedBox(width: 5),
                        Text(
                          "Mix it in one bowl of water (40ml)",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.brightness_1, color: colorBlack, size: 8),
                        SizedBox(width: 5),
                        Text(
                          "Dip the scrubber, squeeze to get powerful lather",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.brightness_1, color: colorBlack, size: 8),
                        SizedBox(width: 5),
                        Text(
                          "Clean to get a sink full of sparkling vessels",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "STORAGE",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "store under cool and dry condition",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " CAUTION:",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Avoid getting in eyes, if this occurs, gentle rinse eyes with water.",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: colorBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
