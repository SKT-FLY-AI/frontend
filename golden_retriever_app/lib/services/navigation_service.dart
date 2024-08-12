// lib/service/navigation_service.dart

import 'package:flutter/cupertino.dart';

void navigateToCalendar(BuildContext context, CupertinoTabController tabController) {
  Navigator.pop(context); // Close the ImageView screen
  tabController.index = 1; // Switch to the calendar tab
}
