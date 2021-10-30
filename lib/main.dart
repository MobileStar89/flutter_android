import 'package:flutter/material.dart';
import 'package:intent_test/AsyncUI/BackgroundThread.dart';
import 'package:intent_test/AsyncUI/OkHttp.dart';
import 'package:intent_test/AsyncUI/RunOnUIThread.dart';
import 'package:intent_test/GestureDetection/1_TapTestApp.dart';
import 'package:intent_test/GestureDetection/2_OtherGestureApp.dart';
import 'package:intent_test/GestureDetection/3_ListView.dart';
import 'package:intent_test/Intent/IncomingIntent.dart';
import 'package:intent_test/Layouts/LayoutWidgetsApp.dart';

void main() {
  // IntentTestApp
  //runApp(IntentTestApp());

  //region - AsyncUI
  //--RunOnUIThread
  // runApp(RunOnUIThreadApp());

  //--BackgroundThread Test
  // runApp(BackgroundThreadApp());

  //--oKhTTP
  // runApp(OkHttpApp());
  //endregion
  
  //region - Layouts
  // runApp(LayoutTestApp());
  //endregion
  
  //region - GestureDetection
  // Single Tap Test
  // runApp(TapTestApp());

  // Double Tap Test
  // runApp(OtherGestureApp());

  // ListView Tap
  runApp(ListViewApp());
  //endregion

}
