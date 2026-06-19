import 'package:carousel_slider/carousel_slider.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:shop_demo/types/home.dart';

class Carousel extends StatefulWidget {
  final List<BannerItem> bannerList;

  Carousel({Key? key, required this.bannerList}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // 轮播图指示器的间距
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  // 轮播图当前索引
  int _currentIndex = 0;

  // 文本输入框控制器
  final TextEditingController _controller = TextEditingController();

  // 给输入框事件添加防抖
  final Debouncer _debouncer = Debouncer(
    Duration(milliseconds: 500),
    initialValue: "",
  );

  // 输入框事件
  void _onChanged(String value) {
    _debouncer.value = value;
  }

  // 顶部搜索框
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.35),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "搜索",
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: _onChanged,
          ),
        ),
      ),
    );
  }

  Widget _getSlider() {
    // 屏幕宽度
    double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _carouselController,
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  // 底部轮播图指示器
  Widget _getIndicators() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerList.length, (int index) {
          return GestureDetector(
            onTap: () {
              _carouselController.jumpToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: _currentIndex == index ? 40 : 20,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 防抖
    _debouncer.values.listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 轮播图
        _getSlider(),
        // TODO: 顶部搜索框
        _getSearch(),
        // TODO: 底部轮播图指示器
        _getIndicators(),
      ],
    );
  }
}
