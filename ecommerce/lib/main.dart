import 'package:ecommerce/source/config/route.dart';
import 'package:ecommerce/source/pages/mainPages.dart';
import 'package:ecommerce/source/pages/product_detail.dart';
import 'package:ecommerce/source/widgets/customRoute.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: GlobalKey(), // Add a GlobalKey as the value for the key parameter
      title: 'E-Commerce ',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Add your theme data here
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name!.contains('detail')) {
          return CustomRoute<bool>(
            builder: (BuildContext context) => ProductDetailPage(
              key: UniqueKey(),
            ),
            settings: settings, // Pass the settings argument here
          );
        } else {
          return CustomRoute<bool>(
            builder: (BuildContext context) => MainPage(
              key: UniqueKey(),
              title: '',
            ),
            settings: settings, // Pass the settings argument here
          );
        }
      },
      initialRoute: "MainPage",
    );
  }
}
