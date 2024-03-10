import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rider/screens/Update_status/undelevired_model/undelevired_modal.dart';

void main() async {
  var headers = {
    'Ridername': 'zainKhan',
    'Riderpassword': 'demo@1234',
    'Cookie': 'PHPSESSID=a1389cec71c136b5934a2769aa583ec7'
  };
  var request = http.Request('POST', Uri.parse('https://falcon.onelogitech.com/api/riderapp_deliverstatus'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // Parse the response JSON
    String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

    // Check if the response contains valid data
    if (jsonResponse.containsKey('status') && jsonResponse.containsKey('data')) {
      // Create model instances from the response data
      Undelevired undelevired = Undelevired.fromJson(jsonResponse);

      // Now you can access and use the data in your model
      if (undelevired.status != null && undelevired.status == 200) {
        if (undelevired.data != null) {
          print('Response: ${undelevired.data!.response}');
          print('Message: ${undelevired.data!.message}');
          if (undelevired.data!.body != null) {
            undelevired.data!.body!.forEach((body) {
              print('Delivery Status Code: ${body.deliveryStatusCode}');
              print('Delivery Status Detail: ${body.deliveryStatusDetail}');
            });
          }
        }
      }
    } else {
      print('Invalid response format');
    }
  } else {
    print('Request failed with status: ${response.reasonPhrase}');
  }
}
