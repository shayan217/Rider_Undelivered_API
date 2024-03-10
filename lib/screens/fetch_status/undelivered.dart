import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/home.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class Fetch_un_delivered extends StatelessWidget {
    final NavigationController _controller = Get.put(NavigationController());
   Fetch_un_delivered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.accent,
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
            Text("Fetch Status"),
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
          children: List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 19,bottom: 12),
              child: Card(
                surfaceTintColor: RColor.grayinput,
                color: RColor.grayinput,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                child: Container(
                  width: 364,
                  // height: 390,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Order No: 19607',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: RColor.secondary,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Sheet No: 23',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: RColor.secondary,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'Consignee Name',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text(
                          'Maryam Altaf',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'Consignee Address',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text(
                          'JS Bank Shahre Faisal Block 323 Karachi',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Karachi',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'Delivery Sheet',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text(
                          '9898778809',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'COD Amount',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: RColor.secondary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Center(child: Text('PKR 2,000/=',style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),)),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Undelivered ",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: RColor.pink,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text("16-8-2023",style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: RColor.secondary,
                          ),),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
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
