import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/home_page_detail.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({super.key});

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    HomePage homePage = HomePage();
    return RefreshIndicator(
      // displacement: 300,
      onRefresh: () async {
        // await Future.delayed(const Duration(milliseconds: 2000));
        CatalogModel.items = [];
        setState(() {});
        await homePage.loadData();
        setState(() {});
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final Catalog = CatalogModel.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageDetails(
                      Catalog: Catalog,
                    ),
                  ),
                );
              },
              child: CatalogItem(Catalog: Catalog),
            ),
          );
        },
      ),
    );
  }
}
