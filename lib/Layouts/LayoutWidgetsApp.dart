import 'package:flutter/material.dart';

class LayoutTestApp extends StatelessWidget {
  const LayoutTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Test App',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        // body: VerticalLayoutWidget(),
        // body: HorizontalLayoutWidget(),
        body: ScrollViewWidget(),
      ),
    );
  }
}



class VerticalLayoutWidget extends StatelessWidget {
  const VerticalLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Row One'),
        Text('Row Two'),
        Text('Row Three')
      ],
    );
  }
}

class HorizontalLayoutWidget extends StatelessWidget {
  const HorizontalLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Column One'),
        Text('Column Two'),
        Text('Column Three')
      ],
    );
  }
}

class ScrollViewWidget extends StatelessWidget {
  const ScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text('Row One'),
        Text('Row two'),
        Text('Row Three')
      ],
    );
  }
}
