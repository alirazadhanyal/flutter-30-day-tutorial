import 'package:flutter/material.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "Rs. ${catalog.price}".text.xl.bold.red900.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlu),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.xl.bold.make())
                .w32(context)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).centered(),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl5.make(),
                      catalog.desc.text.lg.semiBold
                          .textStyle(context.captionStyle)
                          .make(),
                      "Cillum id laborum aliquip ut ut sunt velit quis eu veniam. Consectetur ad aute laboris exercitation qui nulla consequat aliqua. Culpa labore nisi fugiat consequat incididunt quis ea est ad officia id consequat nulla adipisicing. Sint consequat ea deserunt minim est velit in eiusmod adipisicing sint excepteur nisi. Nulla sit adipisicing incididunt pariatur dolore irure labore irure."
                          .text
                          .make()
                          .pLTRB(16, 0, 16, 0)
                    ],
                  ).py64(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
