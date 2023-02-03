import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item Catalog;

  const CatalogItem({super.key, required this.Catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(Catalog.id.toString()),
          child: CatalogImage(
            image: Catalog.imageUrl,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              Catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${Catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    onPressed: (() {}),
                    child: "Buy".text.make(),
                  ),
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        ),
      ],
    )).white.rounded.square(150).make().py16();
  }
}
