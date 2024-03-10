import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/fetch_status/fetch_status.dart';
import 'package:rider/screens/fogot_password/change_password.dart';
import 'package:rider/screens/login/login.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewD extends StatelessWidget {
  Future<void> logout() async {
    // Clear login status in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  const NewD({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.gray,
      appBar: AppBar(
        backgroundColor: RColor.gray,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side heading
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Orio Rider App',
                                style: GoogleFonts.montserrat(
                                  color: RColor.secondary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('asadahmedkhan17@gmail.com',
                                style: GoogleFonts.montserrat(
                                  color: RColor.gray1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Divider(
                            thickness: 1,
                            indent: 20,
                            endIndent: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FetchStatus()),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Image.asset(
                                        RImage.Dr1,
                                        width: 23,
                                        height: 29,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        'Fetch Status',
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Image.asset(RImage.Dr2),
                                  title: Text(
                                    'Call Customer Service',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePasswordS()));
                                  },
                                  child: ListTile(
                                    leading: Image.asset(RImage.Dr3),
                                    title: Text(
                                      'Change Password',
                                      style: GoogleFonts.montserrat(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: ListTile(
                                    leading: Image.asset(
                                      RImage.Dr4,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Text('App Version - V2.00',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Perform logout action
          await logout();
          // Navigate to the login screen using GetX
          Get.offAll(LoginScreen());
        },
        child: Image.asset(RImage.Down),
        backgroundColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}
