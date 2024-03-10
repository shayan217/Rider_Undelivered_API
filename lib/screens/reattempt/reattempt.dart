import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/qr.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/screens/reattempt/model/model.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';

class Reattempt extends StatefulWidget {
  @override
  _ReattemptState createState() => _ReattemptState();
}

class _ReattemptState extends State<Reattempt> {
    final NavigationController _controller = Get.put(NavigationController());

  List<Body> bodyList = []; // List to store fetched data

  Future<void> fetchData() async {
    var headers = {
      'Ridername': 'zainKhan',
      'Riderpassword': 'demo@1234',
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=fc5f9fd74d1006552eb94b08ea7dc0c1'
    };
    var body = {
      // "start_date": "2023-06-01",
      // "end_date": "2023-10-13",
      // "rider_code": "2719"
    };

    final response = await http.post(
      Uri.parse('https://falcon.onelogitech.com/api/riderapp_reattemptFecth'),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final reattemptModel = ReattemptModel.fromJson(jsonDecode(response.body));
      setState(() {
        bodyList = reattemptModel.data?.body ?? [];
      });
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
            Text("Reattempt",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: RColor.secondary,
                )),
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
          children: bodyList.map((body) {
            return Padding(
              padding: const EdgeInsets.only(left: 19, bottom: 12),
              child: Card(
                surfaceTintColor: RColor.grayinput,
                color: RColor.grayinput,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                child: Container(
                  width: 364,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Order No: ${body.shipmentNo}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: RColor.secondary,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Sheet No: ${body.deliverySheet}',
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
                          '${body.consigneeName}',
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
                          '${body.consigneeAddress}',
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
                          '${body.deliverySheet}',
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
                      SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width < 600
                              ? 155
                              : 200,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              // Implement your reattempt logic here
                            },
                            child: Text(
                              'Reattempt',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: RColor.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
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
