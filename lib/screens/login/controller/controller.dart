import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rider/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var loginStatus = false.obs;

  void handleLogin(String riderName, String riderPassword) async {
    try {
      var response = await authenticateUser(riderName, riderPassword);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        var loginStatus = jsonResponse['status'];
        if (loginStatus == 1) {
          // Update login status in shared preferences
          await saveLoginStatus(true);
          Get.offAll(HomeScreen());
        } else {
          Get.snackbar("Login Failed", "Invalid rider name or password");
        }
      } else {
        Get.snackbar("Login Failed", "Failed to authenticate user");
      }
    } catch (e) {
      print("Exception occurred: $e");
      Get.snackbar("Error", "An error occurred while processing your request");
    }
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<http.StreamedResponse> authenticateUser(String riderName, String riderPassword) async {
    var headers = {
      'Ridername': riderName,
      'Riderpassword': riderPassword,
      'Cookie': 'PHPSESSID=a870f9db573e5604ee328f8cebae957a'
    };
    var request = http.Request('POST', Uri.parse('https://falcon.onelogitech.com/api/riderapp_login'));
    request.body = '';
    request.headers.addAll(headers);

    return await request.send();
  }
}
