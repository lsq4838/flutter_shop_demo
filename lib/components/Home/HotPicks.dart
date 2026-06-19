import 'package:flutter/material.dart';

class Hotpicks extends StatefulWidget {
  Hotpicks({Key? key}) : super(key: key);

  @override
  _HotpicksState createState() => _HotpicksState();
}

class _HotpicksState extends State<Hotpicks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("爆款推荐", style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
