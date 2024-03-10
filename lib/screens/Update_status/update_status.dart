import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/Update_status/update_status_widget.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/home.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class Updatestatus extends StatefulWidget {
  Updatestatus({Key? key}) : super(key: key);

  @override
  _UpdatestatusState createState() => _UpdatestatusState();
}

class _UpdatestatusState extends State<Updatestatus> {
     bool isOffRoute = false;
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static final CameraPosition _kGoogLePlex = CameraPosition(
    target: LatLng(24.9056, 67.0822),
    zoom: 14,
  );

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
            Text("Update Status",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,),
                child: Container(
                  height: 500,
                  width: 366 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the border radius as needed
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20),
                    child: SizedBox(
                      height: 500,
                      child: GoogleMap(
                        initialCameraPosition: _kGoogLePlex,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shayan Siddique",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: RColor.secondary,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "JS Bank Shahre Faisal\nBlock 323 Karachi",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: RColor.gray1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "PKR 2,000/=",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        color: RColor.gray1,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Update_status_all_widget(),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar( 
        onTabSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    
   floatingActionButton: ClipRRect(
  borderRadius: BorderRadius.circular(100.0), // Adjust the border radius as needed
  child: SizedBox(
    height: 70.0, // Set the height of the FloatingActionButton
    width: 70.0, // Set the width of the FloatingActionButton
    child: FloatingActionButton(
      onPressed: () {
        // Add your FAB functionality here
      },
      child: Image.asset(
        RImage.QR, // Replace 'your_image.png' with the path to your image asset
       cacheHeight: 70,
        cacheWidth: 70,
      ),
      shape: CircleBorder(),
      backgroundColor: RColor.pink, // Change color as needed
    ),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
