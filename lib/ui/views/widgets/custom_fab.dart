import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Badge(
      isLabelVisible: false,
      // label: Icon(MdiIcons.circle, size: 10, color: MyColor.greenTextColor),
      label: const Text(
        "3",
        style: TextStyle(
          color: MyColor.greenTextColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          "assets/icons/nav.svg",
        ),
      ),
    );
  }
}
