import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: context.theme.accentColor),
        ),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "Rs. ${_cart.totalPrice}"
              .text
              .xl4
              .bold
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying Not Supported Yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "BUY".text.bold.xl4.make())
              .w32(context)
        ],
      ).p32(),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartLisState();
}

class _CartLisState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.items.isEmpty
        ? "Cart Is Empty".text.xl4.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                leading: Icon(Icons.done),
                title: _cart.items[index].name.text.make(),
                trailing: IconButton(
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                    icon: Icon(
                      CupertinoIcons.cart_fill_badge_minus,
                      color: Colors.red,
                    )))),
          );
  }
}
