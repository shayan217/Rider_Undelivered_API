import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/utils/color.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  final int progress1;
  final int progress2;
  final int progress3;
  final Color color1;
  final Color color2;
  final Color color3;
  final String text1;
  final String text2;
  final String text3;

  const CustomCircularProgressIndicator({
    Key? key,
    required this.progress1,
    required this.progress2,
    required this.progress3,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 224,
      decoration: BoxDecoration(
        color: RColor.box, // Set the desired color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(), // Adjusted using media query
                _buildIndicatorWithText(progress1, color1, text1),
                SizedBox(), // Adjusted using media query
                _buildIndicatorWithText(progress2, color2, text2),
                SizedBox(), // Adjusted using media query
                _buildIndicatorWithText(progress3, color3, text3),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 50, // Adjusted using media query
            ),
            Center(
              child: Text(
                'Total Cod Amount',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xff6e6e6e),
                ),
              ),
            ),
            Center(
              child: Text(
                'PKR 20,000.0',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: RColor.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorWithText(int progress, Color color, String text) {
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: color,
          ),
        ),
        SizedBox(height: 10), // Adjusted using media query
        _buildCircularProgressIndicator(progress, color),
      ],
    );
  }

  Widget _buildCircularProgressIndicator(int progress, Color color) {
    return SizedBox(
      // width: screenHeight * 0.1, // Adjusted using media query
      // height: screenHeight * 0.1, // Adjusted using media query
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 74,
            height: 74,
            child: CircularProgressIndicator(
              value: progress / 100,
              backgroundColor: RColor.circle4,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: 5,
            ),
          ),
          Text(
            '$progress',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}