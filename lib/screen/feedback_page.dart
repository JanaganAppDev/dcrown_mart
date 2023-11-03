import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'home_page.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text("Feedback"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    "Please take a minute to write a review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRating = index + 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          size: 45.0,
                          color: (index < _selectedRating)
                              ? Colors.yellow[600]
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    cursorColor: colorGrey2,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Type feedback...",
                      hintStyle: TextStyle(color: colorGrey),
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Container(
                    //margin: EdgeInsets.only(top: 60.0),
                    width: 140.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Rating: $_selectedRating");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Submit"),
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
