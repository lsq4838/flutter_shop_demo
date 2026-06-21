import 'package:shop_demo/constants/index.dart';
import 'package:shop_demo/types/home.dart';
import 'package:shop_demo/utils/DioRequest.dart';

// 轮播图
Future<List<BannerItem>> getBannerListApi() async {
  return ((await dioRequest.get(RequestConstants.bannerUrl)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryListApi() async {
  return ((await dioRequest.get(RequestConstants.categoryUrl)) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐
Future<SpecialRecommendResult> getSpecialRecommendListApi() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(RequestConstants.specialUrl),
  );
}

// 爆款推荐
Future<SpecialRecommendResult> getRecommendListApi() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(RequestConstants.recommendUrl),
  );
}

// 一站买全
Future<SpecialRecommendResult> getOneStopListApi() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(RequestConstants.oneStopUrl),
  );
}
