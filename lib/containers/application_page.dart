import 'package:flutter/material.dart';
import 'package:flutter_r1/controllers/utils.dart';
import 'package:flutter_r1/theme.dart';

class ApplicationPage extends StatelessWidget {
  final bool showFab;
  final bool showBottomNavigationBar;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final List<Widget> actions;
  final Color backgroundColor;
  final double toolbarHeight;
  final LinearGradient gradient;
  final IconData appBarIcon;
  final String appBarTitle;
  final bool disableBack;

  ApplicationPage(
      {this.appBarTitle,
      @required this.body,
      this.showBottomNavigationBar = false,
      this.actions = const [],
      this.showFab = false,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.all(20),
      this.toolbarHeight = 56.0,
      this.appBarIcon = Icons.arrow_back,
      this.disableBack = false,
      this.gradient});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(gradient: gradient),
          padding: appBarTitle != null ? EdgeInsets.only(top: 100) : padding,
          width: MediaQuery.of(context).size.width,
          child: body,
        ),
        if (appBarTitle != null)
          SafeArea(
            top: true,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!disableBack)
                    IconButton(
                      icon: Icon(
                        appBarIcon,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        RouteUtils.goBack(context);
                      },
                    ),
                  Text(
                    appBarTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.medium,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
      ]),
    );
  }
}
