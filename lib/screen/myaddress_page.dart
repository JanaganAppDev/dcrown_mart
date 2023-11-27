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
  String selectedLocation = 'Location';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  TextEditingController nameControler = TextEditingController();
  TextEditingController addresstypeControler = TextEditingController();
  TextEditingController flatnoControler = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  TextEditingController areaControler = TextEditingController();
  TextEditingController landmarkControler = TextEditingController();
  TextEditingController pincodeControler = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  String? validateAddresstype(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your address type';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address type';
    }

    return null;
  }

  String? validateFlatno(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your house/flat no';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid house/flat no';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your address';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address';
    }

    return null;
  }
/*
  String? validateArea(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address type';
    }

    return null;
  }
*/
  String? validateLandmark(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your land mark';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid land mark';
    }

    return null;
  }
  String? validatepincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your pincode';
    }

    final nameRegex = RegExp(r'^[0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid pincode';
    }

    return null;
  }



  void login(String name,addresstype,flatno,address,lankmark,pincode) {} //api



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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller: nameControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateName,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller:addresstypeControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'Address Type',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateAddresstype,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller: flatnoControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'House/Flat no',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator:validateFlatno,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller:addressControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator:validateAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0,top: 15.0),
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
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55.0),
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
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller:landmarkControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'Land Mark',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator:validateLandmark,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                    child: Container(
                      width: 295.0,
                      height: 55,
                      child: TextFormField(
                        controller:pincodeControler,
                        cursorColor: colorPrimary,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          hintText: 'Pin code',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed :colorPrimary,
                            ),
                          ),
                        ),
                        validator: validatepincode,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(left: 45.0,right: 45.0),
                    child: Container(
                      width: 250.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isButtonClicked = true;
                            });
                            print("test");
                            login(nameControler.text.toString(),
                                addresstypeControler.text.toString(),
                                flatnoControler.text.toString(),
                                addressControler.text.toString(),
                                landmarkControler.text.toString(),
                                pincodeControler.text.toString(),);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddresslistPage()));
                          }else{
                            print("test1");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55.0),
                          ),
                        ),
                        child: Text("Save",style: TextStyle(fontWeight:FontWeight.w600,fontSize:25.0),),
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
