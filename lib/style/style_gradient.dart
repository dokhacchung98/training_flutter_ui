import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/color_constant.dart';

class StyleGradient {
  static const gradientBackground = LinearGradient(
    colors: [
      ColorConstant.colorMain1,
      ColorConstant.colorMain2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientBackgroundBottomTab = LinearGradient(
    colors: [
      ColorConstant.colorBottomTab1,
      ColorConstant.colorBottomTab2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static final gradientBackgroundGenres = LinearGradient(
    colors: [
      ColorConstant.colorRectangle1.withOpacity(0.3),
      ColorConstant.colorRectangle2.withOpacity(0.3),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static final gradientBackgroundDotInactive = LinearGradient(
    colors: [
      ColorConstant.colorPaging1.withOpacity(0.3),
      ColorConstant.colorPaging2.withOpacity(0.3),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientBackgroundDotActive = LinearGradient(
    colors: [
      ColorConstant.colorPaging1,
      ColorConstant.colorPaging2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientBackgroundShadowLeft = LinearGradient(
    colors: [
      ColorConstant.colorShadow1,
      ColorConstant.colorShadow2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientBackgroundShadowRight = LinearGradient(
    colors: [
      ColorConstant.colorShadow1,
      ColorConstant.colorShadow2,
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const gradientBackgroundItemSlide = LinearGradient(
    colors: [
      ColorConstant.colorShadowSlide1,
      ColorConstant.colorShadowSlide2,
      Colors.transparent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static final gradientInput = LinearGradient(
    colors: [
      ColorConstant.colorInput1.withOpacity(0.3),
      ColorConstant.colorInput2.withOpacity(0.3),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
