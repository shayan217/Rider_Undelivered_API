import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Update_status/update_status.dart';
import 'package:rider/screens/delevired/delevired.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Update_status_all_widget extends StatefulWidget {
  bool delivery_status_detail = false;
  Update_status_all_widget({
    super.key,
  });
  @override
  State<Update_status_all_widget> createState() =>
      _Update_status_all_widgetState();
}
class _Update_status_all_widgetState extends State<Update_status_all_widget> {
  final List<Map<String, String>> deliveryStatusList = [];
  Future<void> fetchData() async {
    var headers = {
      'Ridername': 'zainKhan',
      'Riderpassword': 'demo@1234',
      'Cookie': 'PHPSESSID=a1389cec71c136b5934a2769aa583ec7'
    };
    var request = http.Request('POST',
        Uri.parse('https://falcon.onelogitech.com/api/riderapp_deliverstatus'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
    if (jsonResponse['status'] == 1 && jsonResponse['data'] != null) {
      List<dynamic> body = jsonResponse['data']['body'];
      deliveryStatusList.clear();
      for (var item in body) {
        deliveryStatusList.add({
          // 'delivery_status_code': item['delivery_status_code'],
          'delivery_status_detail': item['delivery_status_detail']
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width < 600 ? 169 : 200,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Call',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: RColor.secondary,
                    fontSize: 16,
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: RColor.graish,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width < 600 ? 165 : 200,
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
                              RImage.Verified,
                              height: 100,
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Text('Select Completion',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Center(
                              child: Text('Mode',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  // width: 107,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height: 46,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          int selectedIndex = -1;
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return Dialog(
                                                surfaceTintColor: RColor.accent,
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        SizedBox(height: 20),
                                                        Center(
                                                          child: Text(
                                                            'CN Number 5019651022',
                                                            style: GoogleFonts.montserrat(
                                                              fontSize: 21,
                                                              fontWeight: FontWeight.bold,
                                                              color: RColor.secondary,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        Container(
                                                          height: MediaQuery.of(context).size.height * 0.5,
                                                          // color: Colors.pink, // Changing list background color to pink
                                                          color: RColor.accent,
                                                          child: FutureBuilder(
                                                            future: fetchData(),
                                                            builder: (context, snapshot) {
                                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                                return Center(child: CircularProgressIndicator());
                                                              } else if (snapshot.hasError) {
                                                                return Center(child: Text('Error: ${snapshot.error}'));
                                                              } else {
                                                                return ListView.builder(
                                                                  shrinkWrap: true,
                                                                  itemCount: deliveryStatusList.length,
                                                                  itemBuilder: (context, index) {
                                                                    return Card(
                                                                      color: RColor.grayinput, // Changing card background color to pink
                                                                      child: ListTile(
                                                                        title: Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              value: selectedIndex == index,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  if (value!) {
                                                                                    selectedIndex = index; // Set the selected index
                                                                                  } else {
                                                                                    selectedIndex = -1; 
                                                                                  }
                                                                                });
                                                                              },
                                                                              checkColor: RColor.pink, 
                                                                              fillColor: MaterialStateProperty.resolveWith((states) {
                                                                                if (states.contains(MaterialState.selected)) {
                                                                                  return Colors.white;
                                                                                }
                                                                                return Colors.transparent;
                                                                              }),
                                                                            ),
                                                                            SizedBox(width: 8), // Adjust the spacing between checkbox and text
                                                                            Expanded(
                                                                              child: Text(
                                                                                deliveryStatusList[index]['delivery_status_detail'] ?? '',
                                                                                style: GoogleFonts.montserrat(
                                                                                  color: RColor.secondary, // Changing text color to orange
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        if (selectedIndex != -1) // Conditionally show the "Ok" button if an item is selected
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets.all(1.0),
                                                                    child: Dialog(
                                                                      // backgroundColor: Colors.red, // Setting background color to red
                                                                      surfaceTintColor: RColor.accent,
                                                                      child: Container(
                                                                        padding: EdgeInsets.all(20),
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.circular(25.0),
                                                                        ),
                                                                        child: Column(
                                                                          mainAxisSize: MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(height: 50),
                                                                            Center(child: Text('Are you sure you go with\nAddresses Closed status', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w400))),
                                                                            SizedBox(height: 1),
                                                                            Text('updated',
                                                                              style: GoogleFonts.montserrat(
                                                                                fontSize: 18,
                                                                              )),
                                                                            SizedBox(height: 15),
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
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    color: RColor.grayinput, // Change background color to red
                                                                                    border: Border.all(
                                                                                      color: Colors.transparent,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: Alignment.centerLeft,
                                                                                  padding: EdgeInsets.symmetric(horizontal: 10), // Adjust padding if needed
                                                                                  child: TextField(
                                                                                    decoration: InputDecoration(
                                                                                      hintText: 'Any Comment',
                                                                                      border: InputBorder.none,
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        borderSide: BorderSide(color: RColor.grayinput),
                                                                                      ),
                                                                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                                                      hintStyle: TextStyle(color: RColor.secondary),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 15),
                                                                            SizedBox(height: 10),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      // Handle first button action
                                                                                    },
                                                                                    child: Text('No',
                                                                                      style: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        color: RColor.secondary,
                                                                                      )),
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      fixedSize: Size(110, 42), backgroundColor: RColor.graish, // Set width and height of the button
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(10), // Set border radius
                                                                                      ), // Set background color to red
                                                                                    ),
                                                                                  ),
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      // Handle first button action
                                                                                    },
                                                                                    child: Text('Yes',
                                                                                      style: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        color: Colors.white,
                                                                                      )),
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      fixedSize: Size(110, 42), backgroundColor: RColor.pink, // Set width and height of the button
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(10), // Set border radius
                                                                                      ), // Set background color to red
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 50,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 50,
                                                              child: Center(
                                                                child: Text('Ok',
                                                                  style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                  )),
                                                              ),
                                                            ),
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: RColor.pink,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(6),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: SizedBox(
                                      child: Text('Undelivered',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            color: RColor.secondary,
                                            fontSize: 13,
                                          )),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: RColor.graish,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height: 46,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Updatestatus()));
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Delevired()));
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        child: SizedBox(
                                          child: Center(
                                            child: Text('Delevired',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                )),
                                          ),
                                        ),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SizedBox(
                child: Text('End Ride',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: RColor.accent,
                      fontSize: 16,
                    )),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: RColor.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
