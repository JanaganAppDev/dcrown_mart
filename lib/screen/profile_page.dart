import 'package:dcrown_mart/const.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
              ),
            ),
            Text(
              "Yogesh",
              style: TextStyle(
                fontSize: 18.0,
                color: colorWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorWhite.withOpacity(0.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
