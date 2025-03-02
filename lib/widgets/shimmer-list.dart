import 'package:crud_riverpod/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

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
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.grey.withAlpha(100),
                ),
                SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 16,
                  color: Colors.grey.withAlpha(100),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
