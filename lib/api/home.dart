// 轮播图
import 'package:shop_demo/constants/index.dart';
import 'package:shop_demo/types/home.dart';
import 'package:shop_demo/utils/DioRequest.dart';

Future<List<BannerItem>> getBannerListApi() async {
  return ((await dioRequest.get(RequestConstants.bannerUrl)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
