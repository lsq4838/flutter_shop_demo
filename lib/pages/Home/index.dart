import 'package:flutter/material.dart';
import 'package:shop_demo/components/Home/Carousel.dart';
import 'package:shop_demo/components/Home/Category.dart';
import 'package:shop_demo/components/Home/GoodsList.dart';
import 'package:shop_demo/components/Home/HotPicks.dart';
import 'package:shop_demo/components/Home/Recommend.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getSlivers() {
    return [
      // 轮播图组件
      SliverToBoxAdapter(child: Carousel()),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类列表组件
      SliverToBoxAdapter(child: Category()),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐组件
      SliverToBoxAdapter(child: Recommend()),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款推荐组件
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              // Expanded组件用于平均分配空间
              Expanded(child: Hotpicks()),
              SizedBox(width: 10),
              Expanded(child: Hotpicks()),
            ],
          ),
        ),
      ),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品列表组件
      Goodslist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getSlivers());
  }
}
