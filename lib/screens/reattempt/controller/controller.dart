import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rider/screens/reattempt/model/model.dart';

class YourController extends StatefulWidget {
  @override
  _YourControllerState createState() => _YourControllerState();
}

class _YourControllerState extends State<YourController> {
  Future<ReattemptModel?> fetchData() async {
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
      return ReattemptModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: FutureBuilder<ReattemptModel?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final reattemptModel = snapshot.data!;
            // Access your data here
            return Center(
              child: Text('Data Loaded Successfully'),
            );
          } else {
            return Center(
              child: Text('No Data Available'),
            );
          }
        },
      ),
    );
  }
}
