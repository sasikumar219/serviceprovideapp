import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Export/export.dart';



class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key, required this.item}) : super(key: key);
  final int item;
  static final title = 'salomon_bottom_bar';

  @override
  _BottomnavigationState createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    if(widget.item!=0) {
      setState(() {
        _currentIndex=widget.item;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(IconlyLight.home),
          title: Text("Home"),
          selectedColor: Color(0xff6E42E5),
          unselectedColor:Color(0xff242424),
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(IconlyLight.bookmark),
          title: Text("services"),
          selectedColor: Color(0xff6E42E5),
          unselectedColor:Color(0xff242424),
        ),

        /// Search


        /// Profile
        SalomonBottomBarItem(
          icon: Icon(IconlyLight.profile),
          title: Text("Profile"),
          selectedColor: Color(0xff6E42E5),
          unselectedColor:Color(0xff242424),
        ),
      ],
    );
  }
}