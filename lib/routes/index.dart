import 'package:flutter/material.dart';
import 'package:shop_demo/pages/Login/index.dart';
import 'package:shop_demo/pages/Main/index.dart';

// 返回APP根级组件
Widget getRouteWidget() {
  return MaterialApp(routes: getRoutes());
}

// 路由配置
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
