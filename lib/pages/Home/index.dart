import 'package:flutter/material.dart';
import 'package:shop_demo/api/home.dart';
import 'package:shop_demo/components/Home/Carousel.dart';
import 'package:shop_demo/components/Home/Category.dart';
import 'package:shop_demo/components/Home/GoodsList.dart';
import 'package:shop_demo/components/Home/HotPicks.dart';
import 'package:shop_demo/components/Home/Recommend.dart';
import 'package:shop_demo/types/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图数据
  List<BannerItem> _bannerList = [];
  // 分类列表数据
  List<CategoryItem> _categoryList = [];
  // 特惠推荐数据
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 爆款推荐数据
  SpecialRecommendResult _recommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站买全数据
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  List<Widget> _getSlivers() {
    return [
      // 轮播图组件
      SliverToBoxAdapter(child: Carousel(bannerList: _bannerList)),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类列表组件，SliverList、SliverGrid只能纵向滚动，不能横向滚动
      SliverToBoxAdapter(child: Category(categoryList: _categoryList)),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐组件
      SliverToBoxAdapter(
        child: Recommend(specialRecommendResult: _specialRecommendResult),
      ),
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
              Expanded(child: Hotpicks(result: _recommendResult)),
              SizedBox(width: 10),
              Expanded(child: Hotpicks(result: _oneStopResult)),
            ],
          ),
        ),
      ),
      // 设置间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品列表组件
      Goodslist(recommendList: _recommendList),
    ];
  }

  // 滚动控制器
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 获取轮播图数据
    getBannerList();
    // 获取分类列表数据
    getCategoryList();
    // 获取特惠推荐数据
    getSpecialRecommendList();
    // 获取爆款推荐数据
    getRecommendList();
    // 获取一站买全数据
    getOneStopList();
    // 获取推荐列表
    _getRecommendList();
    // 监听滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 60) {
        _getRecommendList();
      }
    });
  }

  // 获取轮播图数据
  void getBannerList() async {
    _bannerList = await getBannerListApi();
    setState(() {});
  }

  // 获取分类列表数据
  void getCategoryList() async {
    _categoryList = await getCategoryListApi();
    setState(() {});
  }

  // 获取特惠推荐数据
  void getSpecialRecommendList() async {
    _specialRecommendResult = await getSpecialRecommendListApi();
    setState(() {});
  }

  // 获取爆款推荐数据
  void getRecommendList() async {
    _recommendResult = await getRecommendListApi();
    setState(() {});
  }

  // 获取一站买全数据
  void getOneStopList() async {
    _oneStopResult = await getOneStopListApi();
    setState(() {});
  }

  //页码
  int _page = 1;
  bool _isLoading = false; //当前是否正在加载
  bool _hasMore = true; //是否还有下一页

  // 获取推荐列表
  void _getRecommendList() async {
    //有请求加载或没有下一页时，放弃请求。
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true; //加锁
    int requestLimit = _page * 8;
    _recommendList = await getGoodsRecommendListAPI({"limit": requestLimit});
    _isLoading = false; //放锁
    setState(() {});
    //获取的数据不够时，证明无下一页，所以调整为false
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: _getSlivers(),
    );
  }
}
