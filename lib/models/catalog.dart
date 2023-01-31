class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Sasuke Uchiha",
        desc: "Sharingan and Rinnegan bearer",
        price: 999,
        color: "#33505a",
        imageUrl:
            "https://www.clearwallpaper.com/wp-content/uploads/2020/12/sasuke-uchiha-wallpaper-0001.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.price,
      required this.imageUrl});
}
