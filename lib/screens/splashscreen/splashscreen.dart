import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/home/home.dart';
import 'package:rider/screens/login/login.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
import 'package:rider/utils/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => checkLogin(),
    );
  }
  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: RColor.gray,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: RColor.primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            height: screenHeight * 0.3,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 1),
                Image.asset(
                  RImage.SplashScreen,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.1,
                ),
                SizedBox(height: 20),
                Text(
                  Rtext.title1,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: RColor.accent,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  Rtext.title2,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: RColor.accent,
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.25),
            child: Container(
              height: screenHeight * 0.5,
              child: Image.asset(
                RImage.SplashScreen1,
                height: screenHeight * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
