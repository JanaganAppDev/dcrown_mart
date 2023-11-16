import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';


class AddresslistPage extends StatefulWidget {
  const AddresslistPage({super.key});

  @override
  State<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends State<AddresslistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary, // Ensure colorPrimary is defined and imported
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Address List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    children: [
                      Text("50/12,sasthri street, chennai-689001")
                    ],
                  ),
                );
              },
            ),
            Container(
              //margin: EdgeInsets.only(top: 60.0),
              width: 140.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text("Add aother address"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
