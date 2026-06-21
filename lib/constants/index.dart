// 全局常量
class GlobalConstants {
  static const String baseUrl = "https://meikou-api.itheima.net";
  static const Duration timeout = Duration(seconds: 10);
  static const String successCode = "1";
}

// 请求地址常量
class RequestConstants {
  // 轮播图
  static const String bannerUrl = "/home/banner";
  // 分类列表
  static const String categoryUrl = "/home/category/head";
  // 特惠推荐
  static const String specialUrl = "/hot/preference";
  // 爆款推荐
  static const String recommendUrl = "/hot/inVogue";
  // 一站买全
  static const String oneStopUrl = "/hot/oneStop";
  // 推荐列表
  static const String recommendListUrl = "/home/recommend";
}
