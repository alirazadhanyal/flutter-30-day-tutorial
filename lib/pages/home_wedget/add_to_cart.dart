import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _catalog = CatalogModel();
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isItInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isItInCart) {
            isItInCart = isItInCart.toggle();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);

            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isItInCart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_fill_badge_plus));
  }
}
