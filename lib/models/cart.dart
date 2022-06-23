import 'package:flutter_application/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //collection of ids - store ids of each items
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unrelated_type_equality_checks
    assert(newCatalog != true);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
