import 'package:flutter/material.dart';

class Goodslist extends StatefulWidget {
  Goodslist({Key? key}) : super(key: key);

  @override
  _GoodslistState createState() => _GoodslistState();
}

class _GoodslistState extends State<Goodslist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            '商品${index + 1}',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}
