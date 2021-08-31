import 'package:flutter_practice/models/catalog.dart';

class Cart {
  late CatalogModel _catalog;
  final List<int> _itemId = []; //Collection of IDs from Catalog

  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemId.add(item.id);
  }

  void remove(Item item) {
    _itemId.remove(item.id);
  }
}
