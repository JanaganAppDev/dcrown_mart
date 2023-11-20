import 'package:dcrown_mart/screen/product_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class ViewallPage extends StatefulWidget {
  const ViewallPage({super.key});

  @override
  State<ViewallPage> createState() => _ViewallPageState();
}

List<bool> addedToCart = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class _ViewallPageState extends State<ViewallPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Popular Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
                print('Container tapped!');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: screenHeigth,
                child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
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
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: colorPrimaryDark,
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      "Rs 200",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Container(
                                        width: 40,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              addedToCart[index] =
                                                  !addedToCart[index];
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
