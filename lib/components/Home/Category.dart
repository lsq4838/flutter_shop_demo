import 'package:flutter/material.dart';
import 'package:shop_demo/types/home.dart';

class Category extends StatefulWidget {
  // 分类列表数据
  final List<CategoryItem> categoryList;

  Category({Key? key, required this.categoryList}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.categoryList[index].picture,
                  width: 40,
                  height: 40,
                ),
                Text(
                  widget.categoryList[index].name,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
