import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';

class PlacedOrderPage extends StatefulWidget {
  const PlacedOrderPage({super.key});

  @override
  State<PlacedOrderPage> createState() => _PlacedOrderPageState();
}

class _PlacedOrderPageState extends State<PlacedOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/crown_img.jpg"),
            ),
            SizedBox(width: 8),
            Text(
              "Placed Order",
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Align(
            alignment: Alignment.center,
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
                      '0',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Center(
              child: Image(
                  width: 100.0,
                  height: 100.0,
                  image: AssetImage("order_image.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 500.0,height: 100.0,
                decoration:BoxDecoration(color: colorWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [BoxShadow(color: colorGrey,blurRadius: 5.0,offset: Offset(0,2))]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Delivery by',style: TextStyle(
                    color:colorGrey1,fontSize: 12.0,
                  ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 500.0,height: 100.0,
                  decoration:BoxDecoration(color: colorWhite,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [BoxShadow(color: colorGrey,blurRadius: 5.0,offset: Offset(0,2))]
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Payment Method',style: TextStyle(
                      color:colorGrey1,fontSize: 12.0,
                    ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
