import 'package:ecommerce/main.dart';
import 'package:ecommerce/source/pages/home_page.dart';
import 'package:ecommerce/source/pages/shopping_cart_page.dart';
import 'package:ecommerce/source/themes/light_color.dart';
import 'package:ecommerce/source/themes/theme.dart';
import 'package:ecommerce/source/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:ecommerce/source/widgets/extentions.dart';
import 'package:ecommerce/source/widgets/title_text.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          _userProfileIcon(),
        ],
      ),
    );
  }

  Widget _userProfileIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 10,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Image.asset("assets/user.png"),
      ),
    ).ripple(() {}, borderRadius: BorderRadius.circular(13));
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.circular(13));
  }

  Widget _title() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _pageTitleText(isHomePageSelected ? 'Our' : 'Shopping'),
              _pageTitleText(isHomePageSelected ? 'Products' : 'Cart'),
            ],
          ),
          Spacer(),
          _deleteIcon(),
        ],
      ),
    );
  }

  Widget _pageTitleText(String text) {
    return TitleText(
      text: text,
      fontSize: 27,
      fontWeight: FontWeight.w400,
    );
  }

  Widget _deleteIcon() {
    return !isHomePageSelected
        ? Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.delete_outline,
              color: LightColor.orange,
            ),
          ).ripple(() {}, borderRadius: BorderRadius.circular(13))
        : SizedBox();
  }

  void onBottomIconPressed(int index) {
    setState(() {
      isHomePageSelected = index == 0 || index == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isHomePageSelected
                            ? MyHomePage(
                                title: '',
                                key: UniqueKey(),
                              )
                            : Align(
                                alignment: Alignment.topCenter,
                                child: ShoppingCartPage(),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
                key: UniqueKey(),
                onIconPressedCallback: (int index) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
