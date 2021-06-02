import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;
  final bool isBottomIndicator;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.onTap,
      required this.selectedIndex,
      this.isBottomIndicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndicator
              ? Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 2))
              : Border(top: BorderSide(color: Palette.facebookBlue, width: 2))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
