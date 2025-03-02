import 'package:crud_riverpod/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  ///Set the title of Custom List
  final String title;

  ///Set the subtitle of Custom List
  final String subtitle;

  ///Set the custom actions button for Custom List
  final List<Widget> actions;

  const CustomList({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Palette.scaffold,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Palette.topBoxShadow,
            offset: Offset(-1, -1),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Palette.bottomBoxShadow,
            offset: Offset(1, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(subtitle),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
        ],
      ),
    );
  }
}
