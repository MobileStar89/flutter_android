import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntentTestApp extends StatelessWidget {
  const IntentTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Shared App Handler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntentTestPage(),
    );
  }
}

class IntentTestPage extends StatefulWidget {
  const IntentTestPage({Key? key}) : super(key: key);

  @override
  _IntentTestPageState createState() => _IntentTestPageState();
}

class _IntentTestPageState extends State<IntentTestPage> {
  static const platform = MethodChannel('app.chanel.shared.data');
  String dataShared = 'No data';


  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dataShared)
      ),
    );
  }

  void getSharedText() async {
    var sharedData = await platform.invokeMethod('getSharedText');
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}

