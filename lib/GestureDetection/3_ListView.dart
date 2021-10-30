import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView & Adapter',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      // home: ListViewPage(),
      home: ListViewPageWithBuilder(),
    );
  }
}

//region - Static ListView
class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: ListView(
        children: _getListData(),
      ),
    );
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(
        GestureDetector(
          onTap: (){
            print('row tapped');
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Row $i'),
          ),
        )
      );
    }
    return widgets;
  }
}
//endregion

//region ListView with ListView.builder
class ListViewPageWithBuilder extends StatefulWidget {
  const ListViewPageWithBuilder({Key? key}) : super(key: key);

  @override
  _ListViewPageWithBuilderState createState() => _ListViewPageWithBuilderState();
}

class _ListViewPageWithBuilderState extends State<ListViewPageWithBuilder> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Builder'),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position){
          return getRow(position);
        }),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widgets.add(getRow(widgets.length));
          print('row $i');
        });
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Row $i'),
      )
    );
  }
}
