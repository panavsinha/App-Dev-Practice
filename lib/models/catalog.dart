class Item {
  final String? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final products = [
  Item(
    id: "001",
    name: "iPhone 11",
    desc: "Brand new iPhone 11",
    price: 899,
    color: "#33505a",
    image:
        "https://images-na.ssl-images-amazon.com/images/I/71w3oJ7aWyL._SL1500_.jpg",
  ),
];
