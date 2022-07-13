import 'package:flutter/material.dart';
import 'package:shopapp/provider/cart.dart';
import './Screens/productoverview.dart';
import 'package:shopapp/Screens/productdetailsscreen.dart';
import 'Screens/cart_screen.dart';
import 'Screens/orders_screen.dart';
import 'provider/products.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/orders.dart';
// import './screens/user_products_screen.dart';
// import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            // EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
