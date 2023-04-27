import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tiles extends StatelessWidget {
  const Tiles({
    this.leading,
    required this.title,
    this.trailing,
    super.key,
  });
  final Widget? leading;
  final Widget title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: Center(
        child: ListTile(
          title: title,
          leading: leading,
          trailing: trailing,
        ),
      ),
    );
  }
}
