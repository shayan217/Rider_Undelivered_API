import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:rider/screens/QR/model/model.dart';

class LoadsheetController {
  final String apiUrl = 'https://falcon.onelogitech.com/api/riderapp_loadsheet';
  final String riderName = 'zainKhan';
  final String riderPassword = 'demo@1234';
  Future<LoadsheetModal?> fetchData(String masterNo) async {
    var headers = {
      'Ridername': riderName,
      'Riderpassword': riderPassword,
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=fc5f9fd74d1006552eb94b08ea7dc0c1'
    };
    var requestBody = json.encode({"master_no": masterNo});
    try {
      var response = await http.post(Uri.parse(apiUrl), headers: headers, body: requestBody);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return LoadsheetModal.fromJson(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception thrown: $e');
      return null;
    }
  }
}


class QRCodeController extends GetxController {
  var scannedDataList = <String>[].obs;

  void setScannedData(String data) {
    scannedDataList.add(data);
  }
}


class QRControllerAPi extends GetxController {
  final scannedResults = <Map<String, dynamic>>[].obs;
  var searchQuery = ''.obs; // Observable for search query
 var isLoading = true.obs;
  Future<void> fetchDataFromAPI(String masterNo) async {
    try {
      var headers = {
        'Ridername': 'zainKhan',
        'Riderpassword': 'demo@1234',
        'Content-Type': 'application/json',
        'Cookie': 'PHPSESSID=fc5f9fd74d1006552eb94b08ea7dc0c1'
      };
      var requestBody = json.encode({"master_no": masterNo});
      var response = await http.post(
          Uri.parse('https://falcon.onelogitech.com/api/riderapp_loadsheet'),
          headers: headers,
          body: requestBody);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var body = jsonResponse['data']['body'];
        if (body != null && body is List) {
          scannedResults.assignAll(body.cast<Map<String, dynamic>>());
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception thrown: $e');
    }
  }

  void filterData(String query) {
    searchQuery.value = query;
    if (query.isNotEmpty) {
      fetchDataFromAPI(query);
    } else {
      scannedResults.clear();
    }
  }
}
