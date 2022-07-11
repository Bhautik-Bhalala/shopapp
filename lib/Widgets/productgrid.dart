import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/provider/products.dart';
import 'productitem.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs ;
  ProductsGrid(this.showFavs);


  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =  showFavs ? productsData.favoriteitemm : productsData.items ;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        // create: (c) => products[i],
        child: ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}