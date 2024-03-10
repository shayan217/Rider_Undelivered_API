import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart'; // Import the custom navigation widget
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/fetch_status/delivered.dart';
import 'package:rider/screens/fetch_status/undelivered.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class FetchStatus extends StatelessWidget {
    final NavigationController _controller = Get.put(NavigationController());
   FetchStatus({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "Fetch Status",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 196, top: 30),
              child: Container(
                width: 158,
                height: 46,
                decoration: BoxDecoration(
                  color: RColor.box,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    '16-8-23 / 17-8-23',
                    style: TextStyle(
                      color: RColor.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 175,
                  height: 137,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: RColor.box,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        RImage.Box2,
                        width: 40,
                        height: 39,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '50',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Delivered', style: TextStyle(color: RColor.gray1)),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 175,
                  height: 137,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: RColor.box,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        RImage.Box1,
                        width: 40,
                        height: 39,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '10',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Reattempt',
                        style: TextStyle(color: RColor.gray1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      child: Container(
                        color: RColor.box,
                        width: 360,
                        height: 140,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order No: 19607',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'View Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  // Add navigation logic here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Fetch_delivered()),
                                  );
                                },
                                child: Text(
                                  'Parcel Delivered Successful',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: RColor.Green,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                                '16-8-2023',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ///////////////////////////////////////////
            Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      child: Container(
                        color: RColor.box,
                        width: 360,
                        height: 140,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order No: 19607',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'View Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  // Add navigation logic here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Fetch_un_delivered()),
                                  );
                                },
                                child: Text(
                                  'Undelivered',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: RColor.pink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                                '16-8-2023',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
