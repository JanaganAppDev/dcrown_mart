import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}
bool _isButtonClicked = false;


class _MyAddressPageState extends State<MyAddressPage> {
  List<String> location = ['Location', 'Madurai', 'Chennai', 'Bangalore', 'Others'];
  String selectedLocation = 'Location'; // Change the initial value here

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary, // Ensure colorPrimary is defined and imported
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('My Address'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                decoration: InputDecoration(
                  hintText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                decoration: InputDecoration(
                  hintText: 'Address Type',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            // ... (rest of the code remains unchanged)
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                decoration: InputDecoration(
                  hintText: 'House/Flat no',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                decoration: InputDecoration(
                  hintText: 'Address',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,top: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Area',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorGrey1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: _isButtonClicked ? Colors.red : Colors.yellow,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue!;
                    });
                  },
                  items: location.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                decoration: InputDecoration(
                  hintText: 'Land Mark',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
              child: TextFormField(
                cursorColor: colorPrimary,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'Pin code',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 45.0,right: 45.0),
              child: Container(
                //margin: EdgeInsets.only(top: 60.0),
                width: screenWidth,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddresslistPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Save",style: TextStyle(fontWeight:FontWeight.w600,fontSize:25.0),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
