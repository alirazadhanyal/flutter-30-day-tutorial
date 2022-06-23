// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/pages/home_details_page.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailsPage(catalog: catalog)));
              },
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.heightBox,
            catalog.name.text.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "Rs. ${catalog.price}".text.red900.make(),
                _addToCart(
                  catalog: catalog,
                )
              ],
            )
          ],
        ))
      ],
    )).white.square(150).rounded.make().py16().w40(context);
  }
}

class _addToCart extends StatefulWidget {
  final Item catalog;
  const _addToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<_addToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);

          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : Icon(CupertinoIcons.add));
  }
}
