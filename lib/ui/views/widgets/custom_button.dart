import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool? isActivated;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isActivated = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActivated == true ? onTap : null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActivated == true ? MyColor.primary : MyColor.neutral250,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 14,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: robotoBold.copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
