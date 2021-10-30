import 'package:flutter/material.dart';
import 'package:intent_test/AsyncUI/BackgroundThread.dart';
import 'package:intent_test/AsyncUI/OkHttp.dart';
import 'package:intent_test/AsyncUI/RunOnUIThread.dart';
import 'package:intent_test/Intent/IncomingIntent.dart';

void main() {
  // IntentTestApp
  //runApp(IntentTestApp());

  //region - AsyncUI
  //--RunOnUIThread
  // runApp(RunOnUIThreadApp());

  //--BackgroundThread Test
  // runApp(BackgroundThreadApp());

  //--oKhTTP
  runApp(OkHttpApp());
  //endregion

}
