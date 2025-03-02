import 'package:crud_riverpod/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActionButton extends StatelessWidget {
  /// Set path of svg icon
  final String svgPath;

  /// Set color to icon
  final Color? color;

  /// Set icon size
  final double? size;

  /// Set onTap function
  final void Function() onTap;

  const CustomActionButton({
    super.key,
    required this.svgPath,
    this.color = Palette.primary,
    this.size = 25,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(
          svgPath,
          width: size,
          height: size,
          color: color,
        ),
      ),
    );
  }
}
