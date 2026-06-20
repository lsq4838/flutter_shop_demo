// 轮播图数据类型
class BannerItem {
  String id;
  String imgUrl;

  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json["id"], imgUrl: json["imgUrl"]);
  }
}

// 分类列表数据类型
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : (json["children"] as List)
                .map(
                  (item) => CategoryItem.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}
