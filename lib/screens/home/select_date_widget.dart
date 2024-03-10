import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rider/screens/home/button_controller.dart';
import 'package:rider/utils/color.dart';
class SelectDateModal extends StatelessWidget {
  final RouteButtonController controller = Get.put(RouteButtonController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: RColor.accent,
      backgroundColor: RColor.accent,
      title: Center(
        child: Text(
          "Select Date",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: RColor.secondary,
          ),
        ),
      ),
      content: SizedBox(
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: RColor.primary5,
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  controller.selectedDate.value != null
                      ? '   ${controller.selectedDate.value!.day}-${controller.selectedDate.value!.month}-${controller.selectedDate.value!.year}'
                      : '   Select Date',
                  style: TextStyle(
                    color: RColor.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _showDatePicker(context);
                },
                icon: Icon(Icons.date_range_outlined),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: RColor.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              fixedSize: Size.fromWidth(100),
            ),
          ),
        )
      ],
    );
  }

void _showDatePicker(BuildContext context) async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    initialEntryMode: DatePickerEntryMode.calendar, // Set initial entry mode to calendar
  );

  if (selectedDate != null) {
    controller.updateSelectedDate(selectedDate);
  }
}



  }
