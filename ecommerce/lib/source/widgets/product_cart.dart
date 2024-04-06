import 'package:ecommerce/source/model/product.dart';
import 'package:ecommerce/source/widgets/extentions.dart';
import 'package:ecommerce/source/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../themes/light_color.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: product.isSelected ? 0 : 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product.isliked ? Icons.favorite : Icons.favorite_border,
                  color:
                      product.isliked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (product.isSelected) SizedBox(height: 15),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      Image.asset(product.image),
                    ],
                  ),
                ),
                TitleText(
                  text: product.name,
                  fontSize: product.isSelected ? 16 : 14,
                ),
                TitleText(
                  text: product.category,
                  fontSize: product.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product.price.toString(),
                  fontSize: product.isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(
        () {
          Navigator.of(context).pushNamed('/detail');
          onSelected(product);
        },
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
