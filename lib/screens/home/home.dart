import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/all_widgets/circle_progressindicator.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/screens/home/select_date_widget.dart';
import 'package:rider/screens/reattempt/reattempt.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class HomeScreen extends StatelessWidget {
  final NavigationController _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              RImage.Vector,
              height: 40,
            ),
            SizedBox(width: 10),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(NewD());
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
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 35),
                child: Image.asset(
                  RImage.Banner,
                  height: 160,
                  width: 350,
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<NavigationController>(
                builder: (controller) => Container(
                  width: 350,
                  height: 60,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        controller.isOffRoute.toggle();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isOffRoute.isTrue
                            ? RColor.pink
                            : RColor.graish,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Obx(
                          () => Text(
                            controller.isOffRoute.isTrue
                                ? 'On Route'
                                : 'OFF Route',
                            style: controller.isOffRoute.isTrue
                                ? GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  )
                                : GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: RColor.secondary,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Shipment Status',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: RColor.secondary,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SelectDateModal();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RColor.graish,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: RColor.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomCircularProgressIndicator(
                progress1: 25,
                progress2: 10,
                progress3: 32,
                color1: RColor.circle1,
                color2: RColor.circle2,
                color3: RColor.circle3,
                text1: 'Remaining',
                text2: 'Delivered',
                text3: 'Other',
              ),
            ],
          ),
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
          borderRadius:
              BorderRadius.circular(100.0), // Adjust the value as needed
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRScreen()));
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
