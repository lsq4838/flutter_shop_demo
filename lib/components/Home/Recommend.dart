import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("推荐", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
