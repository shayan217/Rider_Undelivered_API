import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/Update_status/update_status.dart';
import 'package:rider/utils/color.dart';

class fetch_order_widget extends StatelessWidget {
    // Function to multiply a number by 4 four times
  int multiplyFourTimes(int number) {
    for (int i = 0; i < 4; i++) {
      number *= 4;
    }
    return number;
  }
  const fetch_order_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 5,
      child: Container(
        width: 370,
        height: 452,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Order No: 19607',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Sheet No: 23',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Consignee Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'Maryam Altaf',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'Consignee Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'JS Bank Shahre Faisal Block 323 Karachi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Text(
                'Karachi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Delivery Sheet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                '9898778809',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 10),
            Center(
              child: Text(
                'COD Amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'PKR ${multiplyFourTimes(2000)}/=', // Display the multiplied amount
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width < 600
                                ? 144
                                : 200,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                              },
                              child: Text(
                                'Call Customer',
                                style: GoogleFonts.montserrat( fontWeight: FontWeight.w600,
                                  color: RColor.secondary,
                                  fontSize: 15,)
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RColor.graish,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width < 600
                                ? 140
                                : 200,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Updatestatus()));
                              },
                              child: Text(
                                'Updated Status',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15,
                                )
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
  }
}
