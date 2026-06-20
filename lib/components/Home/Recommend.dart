import 'package:flutter/material.dart';
import 'package:shop_demo/types/home.dart';

class Recommend extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;
  Recommend({Key? key, required this.specialRecommendResult}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  // 取前三条数据
  List<GoodsItem> _top3Items() {
    if (widget.specialRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  // 标题
  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 99, 2, 2),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '精选省攻略',
          style: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(255, 108, 14, 14),
          ),
        ),
      ],
    );
  }

  // 左侧项图片
  Widget _buildLeftItem() {
    return Container(
      width: 100,
      height: 179.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('lib/assets/images/big_sale.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 右侧推荐项(只展示3个)
  List<Widget> _buildRightItems() {
    List<GoodsItem> items = _top3Items();
    return List.generate(items.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              // 图片加载失败时的处理
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('lib/assets/images/big_sale.jpeg');
              },
              items[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            height: 20,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: Text(
              '￥${items[index].price}',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('lib/assets/images/recommend_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildTitle(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeftItem(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildRightItems(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
