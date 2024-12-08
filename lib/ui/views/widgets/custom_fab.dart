import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomFAB extends StatelessWidget {
  final Color? bgColor;
  final bool isAdmin;

  const CustomFAB({
    super.key,
    this.bgColor = MyColor.primary40,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        MdiIcons.plus,
        color: MyColor.secondary,
        size: 32,
      ),
    );
  }
}
