import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class HistoryScreen extends StatelessWidget {
    final NavigationController _controller = Get.put(NavigationController());

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("History",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: RColor.secondary,)),
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
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today 10-Aug-2023",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: RColor.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: RColor.grayinput,
              color: RColor.grayinput,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 1,
              child: Container(
                width: 368,
                // height: 390,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maryam Altaf',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: RColor.secondary,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'COD',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: RColor.secondary,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PKR 2,000/=',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: RColor.TextColor2,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'JS Bank Shahre Faisal Block\n323 Karachi',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Delivery Sheet',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: RColor.secondary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '9898778809',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2: 11 PM',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: RColor
                              .TextColor2,
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 26,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Delivered',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: RColor.accent,
                                  fontSize: 12,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RColor.textColorgreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 2,
                      endIndent: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Arman Saleem',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: RColor.secondary,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'COD',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: RColor.secondary,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PKR 5,000/=',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: RColor.TextColor2,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'JS Bank Shahre Faisal Block\n323 Karachi',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Delivery Sheet',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: RColor.secondary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '9898778809',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4: 10 PM',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: RColor.TextColor2,
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 26,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Delivered',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: RColor.accent,
                                  fontSize: 12,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RColor.textColorgreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today 10-Aug-2023",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: RColor.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: RColor.primary5,
              color: RColor.primary5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 1,
              child: Container(
                width: 368,
                // height: 390,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maryam Altaf',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: RColor.secondary,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'COD',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: RColor.secondary,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PKR 2,000/=',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: RColor.TextColor2,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'JS Bank Shahre Faisal Block\n323 Karachi',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Delivery Sheet',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: RColor.secondary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '9898778809',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2: 11 PM',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: RColor.TextColor2,
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 26,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Reattempt',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: RColor.accent,
                                  fontSize: 12,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RColor.textColorred,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 2,
                      endIndent: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Arman Saleem',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: RColor.secondary,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'COD',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: RColor.secondary,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PKR 5,000/=',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: RColor.TextColor2,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'JS Bank Shahre Faisal Block\n323 Karachi',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Delivery Sheet',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: RColor.secondary,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '9898778809',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: RColor.TextColor2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4: 10 PM',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: RColor.TextColor2,
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 26,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Reattempt',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: RColor.accent,
                                  fontSize: 12,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RColor.textColorred,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
       bottomNavigationBar: CustomNavigationBar(
        onTabSelected: _controller.changePage,
        selectedIndex: _controller.selectedIndex.value,
      ),
     floatingActionButton: SizedBox(
  width: 70, // Adjust width as needed
  height: 70, // Adjust height as needed
  child: ClipRRect(
    borderRadius: BorderRadius.circular(100.0), // Adjust the value as needed
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