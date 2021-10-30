import 'package:flutter/material.dart';

class TapTestApp extends StatelessWidget {
  const TapTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Test App',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: TapTestPage(),
    );
  }
}

class TapTestPage extends StatelessWidget {
  const TapTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Tap Test'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('tap');
          },
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
