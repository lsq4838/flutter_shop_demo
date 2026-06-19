import 'package:flutter/material.dart';
import 'package:shop_demo/pages/Cart/index.dart';
import 'package:shop_demo/pages/Category/index.dart';
import 'package:shop_demo/pages/Home/index.dart';
import 'package:shop_demo/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 底部导航栏
  final List<Map<String, String>> _navList = [
    {
      "icon": "lib/assets/icons/home_normal.png",
      "activeIcon": "lib/assets/icons/home_active.png",
      "label": "首页",
    },
    {
      "icon": "lib/assets/icons/category_normal.png",
      "activeIcon": "lib/assets/icons/category_active.png",
      "label": "分类",
    },
    {
      "icon": "lib/assets/icons/cart_normal.png",
      "activeIcon": "lib/assets/icons/cart_active.png",
      "label": "购物车",
    },
    {
      "icon": "lib/assets/icons/mine_normal.png",
      "activeIcon": "lib/assets/icons/mine_active.png",
      "label": "我的",
    },
  ];

  // 底部导航栏当前索引
  int _currentIndex = 0;

  // 底部导航栏配置项
  List<BottomNavigationBarItem> _getItems() {
    return List.generate(_navList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_navList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _navList[index]["activeIcon"]!,
          width: 30,
          height: 30,
        ),
        label: _navList[index]["label"]!,
      );
    });
  }

  // 底部导航栏点击事件
  void _onTabTapped(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea组件用于避免内容被状态栏遮挡
      body: SafeArea(
        // IndexedStack组件用于根据索引显示不同的子组件
        child: IndexedStack(
          index: _currentIndex,
          children: [HomeView(), CategoryView(), CartView(), MineView()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getItems(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        onTap: _onTabTapped,
      ),
    );
  }
}
