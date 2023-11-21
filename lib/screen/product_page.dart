import 'package:dcrown_mart/screen/home_page.dart';
import 'package:dcrown_mart/screen/mycart_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int itemCount = 0;
  String selectedSize = '500ML';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 170.0, left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorPrimary,
                      ),
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
                  ),
                  Image.asset(
                    'dishwash1.jpg',
                    height: 250.0,
                    width: 250.0,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 170.0, right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorPrimary,
                      ),
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyCartPage()),
                              );
                            },
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
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                height: 640.0,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
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
                        "STORAGE:",
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
                    Row(
                      children: [
                        Text(
                          "Rs 150.0",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: colorPrimary,
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 25.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: colorPrimary,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton<String>(
                                value: selectedSize,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSize = newValue!;
                                  });
                                },
                                items: <String>[
                                  '500ML',
                                  '1000ML',
                                  '2000ML'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 13.0, color: colorGrey2),
                                    ),
                                  );
                                }).toList(),
                                style: TextStyle(
                                    fontSize: 13.0, color: colorGrey2),
                                icon: Icon(Icons.arrow_drop_down),
                                underline: SizedBox.shrink(),
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                itemCount = (itemCount > 0) ? itemCount - 1 : 0;
                              });
                            },
                            child: Container(
                              height: 25.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: colorPrimary,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.remove,
                                      color: colorBlack, size: 16),
                                  Text(
                                    itemCount.toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: colorBlack,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        itemCount++;
                                      });
                                    },
                                    child: Icon(Icons.add,
                                        color: colorBlack, size: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Container(
                        width: 450.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            "Continue Shopping",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
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
    );
  }
}
