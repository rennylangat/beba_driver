import 'package:beba_driver/ui/common/globals.dart';
import 'package:flutter/material.dart';

class CustSnackbar {
  static void showSnackBar(
    String? title,
    String message, {
    Color backgroundColor = Colors.transparent,
    Color colorText = Colors.black,
    SnackStyle snackStyle = SnackStyle.FLOATING,
    SnackPos snackPosition = SnackPos.BOTTOM,
  }) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                color: colorText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              style: TextStyle(
                color: colorText,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
    snackBarKey.currentState?.showSnackBar(
      snackBar,
      snackBarAnimationStyle: AnimationStyle(
        reverseCurve: Curves.easeOutCirc,
        curve: Curves.easeOutCirc,
        reverseDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

/// Indicates if snack is going to start at the [TOP] or at the [BOTTOM]

enum SnackPos { TOP, BOTTOM }

/// Indicates if snack will be attached to the edge of the screen or not
enum SnackStyle { FLOATING, GROUNDED }
