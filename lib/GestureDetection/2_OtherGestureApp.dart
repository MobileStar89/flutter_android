import 'package:flutter/material.dart';

class OtherGestureApp extends StatelessWidget {
  const OtherGestureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Other Gesture App',
      home: OtherGesturePage(),
    );
  }
}

class OtherGesturePage extends StatefulWidget {
  const OtherGesturePage({Key? key}) : super(key: key);

  @override
  _OtherGesturePageState createState() => _OtherGesturePageState();
}


class _OtherGesturePageState extends State<OtherGesturePage> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 2000)
    );

    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: RotationTransition(
            turns: curve,
            child: FlutterLogo(
              size: 200.0
            ),
          ),
        )
      )
    );
  }
}
