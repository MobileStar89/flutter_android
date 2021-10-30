import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RunOnUIThreadApp extends StatelessWidget {
  const RunOnUIThreadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run On UIThread',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: RunOnUIThreadPage(),
    );
  }
}

class RunOnUIThreadPage extends StatefulWidget {
  const RunOnUIThreadPage({Key? key}) : super(key: key);

  @override
  _RunOnUIThreadPageState createState() => _RunOnUIThreadPageState();
}

class _RunOnUIThreadPageState extends State<RunOnUIThreadPage> {
  List widgets = [];


  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Run On UI Thread'),
      ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position){
            return getRow(position);
          },
      ),
    );
  }
}
