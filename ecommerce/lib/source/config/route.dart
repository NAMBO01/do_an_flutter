import 'package:ecommerce/source/pages/mainPages.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => MainPage(
            key: UniqueKey(), title: '', // Provide a Key object here
          ),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
