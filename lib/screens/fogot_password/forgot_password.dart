import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/fogot_password/otp.dart';
import 'package:rider/screens/login/login.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class ForgotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( surfaceTintColor: Colors.white,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  RImage.Forgot, 
                  width: 120, 
                ),
                SizedBox(height: 20),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 10),
                 Text(
                  'Enter your phone number to received',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                     color: Colors.grey,
                  )
                ),
                Text(
                  'passwrd to reset instruction',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                     color: Colors.grey,
                  )
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '123456789',
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
                  ),
                ),
                // SizedBox(height: 3),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 305,
                      child: Center(
                        child: Text(
                          'Send',
                          style: GoogleFonts.montserrat(
                            color: RColor.accent,
                            fontSize: 18,
                          )
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RColor.pink,
                      minimumSize: Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                    ),
                  ),
                
                SizedBox(height: 150),
                 GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                        // Get.to(SignupScreen());
                      },
                      child: Text(
                        'Back to login',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
