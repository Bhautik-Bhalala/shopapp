import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/provider/products.dart';
import 'productdetailsscreen.dart';
import '../widgets/productitem.dart';
import 'package:shopapp/Widgets/productgrid.dart';

enum FilterOptions{
  Favourite,
  All,

}


class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavouritesOnly = false;


  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context , listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected:(FilterOptions selectedvalue){
              setState(() {
                if (selectedvalue == FilterOptions.Favourite){
                  // productsContainer.showFavouriteOnly();
                  _showFavouritesOnly = true;
                }else{
                  _showFavouritesOnly = false;
                  // productsContainer.showall();
                }
                print(selectedvalue);
              });

            } ,
              icon: Icon(
                Icons.more_vert
              ),
              itemBuilder: (_)
          =>[
            PopupMenuItem(child: Text('Only Favourites'), value : FilterOptions.Favourite),
            PopupMenuItem(child: Text('Show All'), value : FilterOptions.All),

          ],
          ),
          

        ],
      ),
      body: ProductsGrid(_showFavouritesOnly),
    );
  }
}