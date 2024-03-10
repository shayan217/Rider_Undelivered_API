import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Delevired extends StatefulWidget {
  Delevired({Key? key}) : super(key: key);

  @override
  State<Delevired> createState() => _DeleviredState();
}

class _DeleviredState extends State<Delevired> {
  final NavigationController _controller = Get.put(NavigationController());

  late final GlobalKey<SfSignaturePadState> _signaturePadKey;

  @override
  void initState() {
    super.initState();
    _signaturePadKey = GlobalKey<SfSignaturePadState>();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              "Delivered",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: RColor.secondary,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewD()
                  ),
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
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: RColor.graish,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   CN Number:  5019283555',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: RColor.graish,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   Consignee Name :  Maryam Altaf',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: RColor.graish,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   Cash Collection:  Rs. 119',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 260,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: RColor.primary5,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                      child: SfSignaturePad(
                        key: _signaturePadKey,
                        backgroundColor: RColor.primary5,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 145,
                      child: Text(
                        "Signature",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: RColor.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    _signaturePadKey.currentState!.clear();
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(color: RColor.textColorred),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: RColor.graish,
                    hintText: 'Receiver Name',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: RColor.graish,
                    hintText: 'Rider Comment',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  RImage.Verifiy,
                                  height: 150,
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    'Success',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Thank you! Your Order has been Submitted.',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: RColor.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    fixedSize: Size.fromWidth(120),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.montserrat(
                      color: RColor.accent,
                      fontSize: 18,
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
              SizedBox(
                height: 100,
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
        width: 70,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScreen()),
              );
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
