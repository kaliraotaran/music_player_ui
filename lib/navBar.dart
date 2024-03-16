

import 'package:flutter/material.dart';
import 'package:music_player_ui/color.dart';

class NavigationsBar extends StatelessWidget {
  const NavigationsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        NavItem(icondata: Icons.arrow_back_ios,),
        Text('Playing Now'),
        NavItem(icondata: Icons.list,),
        
      ]),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.icondata});
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Icon(icondata, color: secondaryColor,),
    );
  }
}