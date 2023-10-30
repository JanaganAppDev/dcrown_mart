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
                          backgroundImage: AssetImage("assets/crown_img.jpg"),
                        ),
                        SizedBox(height: 4.0),
                        Text('grocery'),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0), // Add a SizedBox with 16.0 pixels of height
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "crown super deals",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Change the color to your desired color
                borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 5.0, // Spread of the shadow
                    offset: Offset(0, 2), // Shadow offset (x, y)
                  ),
                ],
              ),
              height: 180.0, // Set the height of the container
              width: 150.0, // Set the fixed width of the container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align the content to the left
                mainAxisAlignment: MainAxisAlignment.end, // Align the content to the bottom
                children: [
                  Image.asset('dishwash.jpeg',height: 100.0,width: 100.0,alignment: Alignment.center,), // Replace 'assets/your_image.png' with your image path
                  SizedBox(height: 4.0), // Add spacing between the image and the text
                  Text(
                    "DISHWASH LIQUID",
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 3.0),
                  Text("Rs 150",style: TextStyle(fontSize:10.0,fontWeight: FontWeight.bold,color: Colors.yellow),
                  )
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
