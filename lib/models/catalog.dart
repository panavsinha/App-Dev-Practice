class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "iPhone 11",
      desc: "Brand new iPhone 11",
      price: 899,
      color: "#33505a",
      image:
          "https://images-na.ssl-images-amazon.com/images/I/71w3oJ7aWyL._SL1500_.jpg",
    ),
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
