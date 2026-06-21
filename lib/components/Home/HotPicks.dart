import 'package:flutter/material.dart';
import 'package:shop_demo/types/home.dart';

class Hotpicks extends StatefulWidget {
  final SpecialRecommendResult result;
  Hotpicks({Key? key, required this.result}) : super(key: key);

  @override
  _HotpicksState createState() => _HotpicksState();
}

class _HotpicksState extends State<Hotpicks> {
  // 标题组件
  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          widget.result.title,
          style: TextStyle(
            color: const Color.fromARGB(255, 93, 2, 2),
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.result.title == "爆款推荐" ? "最受欢迎" : "核心优选",
          style: TextStyle(
            color: const Color.fromARGB(255, 109, 33, 33),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // 获取商品前两条数据
  List<GoodsItem> get _goodsItems {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  // 商品Widget
  List<Widget> _buildGoodsItems() {
    return _goodsItems.map((item) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("lib/assets/images/big_sale.jpeg");
                },
                item.picture,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              child: Text(
                item.price,
                style: TextStyle(
                  color: const Color.fromARGB(255, 93, 2, 2),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.result.title == "爆款推荐"
            ? const Color.fromARGB(255, 150, 211, 235)
            : const Color.fromARGB(255, 232, 237, 129),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildTitle(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildGoodsItems(),
          ),
        ],
      ),
    );
  }
}
