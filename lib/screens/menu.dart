

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/const.dart';
import '../strings/restaurant_home_strings.dart';
import '../widgets/menu/categories_menu_widget.dart';
import '../widgets/menu/home_menu_widget.dart';

class MenuScreen extends StatelessWidget
{
  final ZoomDrawerController zoomDrawerController;

  MenuScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(child: Column(children: [
        Row(
          children: [
            DrawerHeader(child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Color(COLOR_ICON_DRAWER),
                    child: Icon(
                      Icons.restaurant,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
        Divider(thickness: 1,),
        HomeMenuWidget(zoomDrawerController: zoomDrawerController),
        Divider(thickness: 1,),
        CategoriesMenuWidget()
      ],),),
    );
  }

}


