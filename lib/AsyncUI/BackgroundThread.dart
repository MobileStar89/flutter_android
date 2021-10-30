import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BackgroundThreadApp extends StatelessWidget {
  const BackgroundThreadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isolate Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BackgroundThreadPage(),
    );
  }
}

class BackgroundThreadPage extends StatefulWidget {
  const BackgroundThreadPage({Key? key}) : super(key: key);

  @override
  _BackgroundThreadPageState createState() => _BackgroundThreadPageState();
}

class _BackgroundThreadPageState extends State<BackgroundThreadPage> {
  List widgets = [];


  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody() {
    bool showLoadingDialog = widgets.isEmpty;
    if (showLoadingDialog) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  Widget getProgressDialog() {
    return Center(
      child:CircularProgressIndicator()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate Test App'),
      ),
      body: getBody(),
    );
  }

  // Load data
  Future<void> loadData() async {
    ReceivePort receivePort = ReceivePort();
    print("1 - 1");
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    print("1 - 2");
    SendPort sendPort = await receivePort.first;

    print("1 - 3");
    List msg = await sendReceive(
      sendPort,
      'https://jsonplaceholder.typicode.com/posts',
    );
    print("1 - 4");

    setState(() {
      widgets = msg;
    });
  }
  
  ListView getListView() {
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        });
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  // The entry point for the isolate
  static Future<void> dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();
    print("2 - 1");
    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);
    print("2 - 2");

    await for (var msg in port) {
      print("2 - 3");
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(Uri.parse(dataURL));
      print("2 - 4");
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body));
      print("2 - 5");
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}
