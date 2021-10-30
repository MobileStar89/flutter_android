import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OkHttpApp extends StatelessWidget {
  const OkHttpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OkHttp Equivalent',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: OkHttpPage(),
    );
  }
}

class OkHttpPage extends StatefulWidget {
  const OkHttpPage({Key? key}) : super(key: key);

  @override
  _OkHttpPageState createState() => _OkHttpPageState();
}

class _OkHttpPageState extends State<OkHttpPage> {
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

  Widget getProgressDialog(){
    return Center(child: CircularProgressIndicator(),);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OkHttp App'),
      ),
      body: getBody(),
    );
  }

  ListView getListView() {
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        }
    );
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"),
    );
  }
  
  Future<void> loadData() async {
    print("1");
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    print("2");
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
