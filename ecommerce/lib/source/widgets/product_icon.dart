import 'package:ecommerce/source/model/category.dart';
import 'package:ecommerce/source/themes/light_color.dart';
import 'package:ecommerce/source/themes/theme.dart';
import 'package:ecommerce/source/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;

  const ProductIcon({
    Key? key,
    required this.model,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? SizedBox(width: 5)
        : GestureDetector(
            onTap: () {
              onSelected(model);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.isSelected
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? LightColor.orange : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  if (model.image != null) Image.asset(model.image!),
                  if (model.name != null)
                    TitleText(
                      text: model.name!,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                ],
              ),
            ),
          );
  }
}
