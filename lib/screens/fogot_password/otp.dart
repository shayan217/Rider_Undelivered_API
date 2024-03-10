import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/all_widgets/otp_widgets.dart';
import 'package:rider/screens/fogot_password/create_password.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.accent,
      appBar: AppBar(
        surfaceTintColor: RColor.accent,
        shadowColor: RColor.accent,
        backgroundColor: RColor.accent,
        title: Text(
          "OTP",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: RColor.TextColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                RImage.Otp,
                height: 196,
                width: 176,
              ),
              SizedBox(height: 10),
              Text(
                'Code is sent to 03113294921',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: RColor.TextColor1,
                ),
              ),
              Text(
                'Didn’t receive code? Request Again',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: RColor.TextColor1,
                ),
              ),
              SizedBox(height: 25),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpTextField(),
                  OtpTextField(),
                  OtpTextField(),
                  OtpTextField(),
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        surfaceTintColor: RColor.accent,
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
                              'Verified!',
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Asad, You have successfully',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: RColor.TextColor1,
                              ),
                            ),
                            Text(
                              'verified the account',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: RColor.TextColor1,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePasswordScreen()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: RColor.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: Size(157, 55),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: RColor.accent,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
