import 'package:kip/utils/style_util.dart';
import 'package:flutter/material.dart';

class TopOfAppBar extends StatelessWidget {
  final Color color;
  const TopOfAppBar({
    required this.width,
    this.color = MyStyle.white,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: color,
      height: MediaQuery.of(context).padding.top,
      width: width,
    );
  }
}
