import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rider/screens/Drawer/drawer.dart';
import 'package:rider/screens/QR/controller/controller.dart';
import 'package:rider/screens/QR/qr_scann_functionality.dart';
import 'package:rider/screens/custom_navigation/custom_navigation.dart';
import 'package:rider/screens/home/navigation_controller.dart';
import 'package:rider/utils/color.dart';
import 'package:rider/utils/image.dart';
class QRScreen extends StatelessWidget {
  final QRCodeController qrController = Get.put(QRCodeController());
  final NavigationController _controller = Get.put(NavigationController());

  final QRControllerAPi qrControllerAPi = Get.put(QRControllerAPi());

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: RColor.accent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Scan QR Code"),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(QRScannerScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                RImage.MainQR,
                height: 32,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(NewD());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                RImage.Menu,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    onChanged: (value) => qrControllerAPi.filterData(value),
                    decoration: InputDecoration(
                      hintText: 'Search by Master No.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Obx(
                  () {
                    final searchQuery = qrControllerAPi.searchQuery.value;
                    if (searchQuery.trim().isEmpty) {
                      return Center(
                        child: Text(
                          'Please enter a search data',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    } else {
                      final filteredResults =
                          qrControllerAPi.scannedResults.where((data) {
                        final masterNo =
                            data['master_no'].toString().toLowerCase();
                        return masterNo.contains(searchQuery.toLowerCase());
                      }).toList();

                      // Check if filteredResults is empty
                      if (filteredResults.isEmpty) {
                        return Center(
                          child: Text(
                            'No data found with this ID',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredResults.length,
                          itemBuilder: (context, index) {
                            var data = filteredResults[index];
                            return Card(
                              surfaceTintColor: RColor.primary5,
                              color: RColor.primary5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 5.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text("Master No: ${data['master_no']}"),
                                      Text(
                                          "Shipment No: ${data['shipment_no']}"),
                                      Text(
                                          "Shipment Date: ${data['shipment_date']}"),
                                      Text(
                                          "Consignee Name: ${data['consignee_name']}"),
                                      Text(
                                          "Consignee Address: ${data['consignee_address']}"),
                                      Text(
                                          "Cash Collect: ${data['cash_collect']}"),
                                      Text(
                                          "Consignee Contact: ${data['consignee_contact']}"),
                                      Text(
                                          "Account Number: ${data['account_number']}"),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      qrControllerAPi.scannedResults
                                          .removeAt(index);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
              Obx(
                () => Column(
                  children: qrController.scannedDataList.map((data) {
                    return Card(
                      surfaceTintColor: RColor.primary5,
                      color: RColor.primary5,
                      elevation: 1,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: ListTile(
                        title: Text(
                          data,
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                           qrController.scannedDataList.remove(data);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
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
