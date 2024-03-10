import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/home.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';


class ChangePasswordS extends StatefulWidget {
  const ChangePasswordS({Key? key}) : super(key: key);

  @override
  _ChangePasswordSState createState() => _ChangePasswordSState();
}

class _ChangePasswordSState extends State<ChangePasswordS> {
  final NavigationController _controller = Get.put(NavigationController());

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Change Password"),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewD()),
                );
              },
              child: Image.asset(
                RImage.Menu,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Here you can generate your new password",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: RColor.primary3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Old Password",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: RColor.primary8,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    cursorColor: RColor.pink,
                    obscureText: !_isOldPasswordVisible,
                    style: TextStyle(color: RColor.primary3),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isOldPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isOldPasswordVisible = !_isOldPasswordVisible;
                          });
                        },
                      ),
                      fillColor: RColor.primary5,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "New Password",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: RColor.primary8,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    cursorColor: RColor.pink,
                    obscureText: !_isNewPasswordVisible,
                    style: TextStyle(color: RColor.primary3),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isNewPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                        },
                      ),
                      fillColor: RColor.primary5,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: RColor.primary8,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    cursorColor: RColor.pink,
                    obscureText: !_isConfirmPasswordVisible,
                    style: TextStyle(color: RColor.primary3),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      fillColor: RColor.primary5,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 400,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              surfaceTintColor: Colors.white,
                              backgroundColor: Colors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    RImage.Verifiy,
                                    height: 157,
                                    width: 157,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Successfully',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Your password has been changed',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: RColor.gray1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: RColor.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      fixedSize: Size.fromWidth(100),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RColor.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 250,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        onTabSelected: _controller.changePage,
        selectedIndex: _controller.selectedIndex.value,
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QRScreen()));
            },
            child: Image.asset(
              RImage.QR,
              cacheHeight: 70,
              cacheWidth: 70,
            ),
            shape: CircleBorder(),
            backgroundColor: RColor.pink,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
