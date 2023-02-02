import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:shopping_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.mV32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print("done refresh");
        return await Future.delayed(const Duration(milliseconds: 2000));
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final Catalog = CatalogModel.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CatalogItem(Catalog: Catalog),
          );
        },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog;

  const CatalogItem({super.key, required this.Catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: Catalog.imageUrl,
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

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.make().p16().w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
          "Trending products".text.xl2.make(),
        ],
      ),
    );
  }
}
