import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider/screens/fetch_order/fetch_order.dart';
import 'package:rider/screens/history/history.dart';
import 'package:rider/screens/home/home.dart';
import 'package:rider/screens/reattempt/reattempt.dart';
import 'package:rider/utils/color.dart';
class CustomNavigationBar extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    FetchorderScreen(),
    Reattempt(),
    HistoryScreen(),
  ];
  final Function(int) onTabSelected;
  final int selectedIndex;
  CustomNavigationBar({
    required this.onTabSelected,
    required this.selectedIndex,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 79.0, // Increased height for the navigation bar
      height: 81.0,
      child: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: RColor.secondary,
        elevation: 10,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildIconButton(context, Icons.home_rounded, 'Home', 0),
      _buildIconButton(context, Icons.holiday_village_rounded, 'Fetch Orders', 1),
      SizedBox(width: 30),
      _buildIconButton(context, Icons.refresh, 'Reattempt', 2),
      _buildIconButton(context, Icons.history, 'History', 3),
    ],
  ),
],

        ),
      ),
    );
  }
  IconButton _buildIconButton(BuildContext context, IconData icon, String iconName, int index) {
    return IconButton(
      icon: Column(
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? RColor.secondary : RColor.active,
          ),
          Text(
            iconName,
            style: TextStyle(
              color: selectedIndex == index ? RColor.secondary : RColor.active,
              fontSize: 12, // Adjust the font size as needed
            ),
          ),
        ],
      ),
      onPressed: () {
        onTabSelected(index);
        _navigateToPage(context, index);
      },
      tooltip: iconName,
    );
  }
  void _navigateToPage(BuildContext context, int index) {
    Get.to(_pages[index], transition: Transition.noTransition);
  }
}
