import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_colors.dart';

import '../widgets/on_hover.dart';

class AppConst {
  static const String currentAppName = 'Scrips Task';





  static buildHoverIcon(
      {required IconData icon, required GestureTapCallback? onTap}) {
    return OnHover(builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                color: isHovered ? AppColors.colorAppbarHover : null,
                borderRadius: BorderRadius.circular(8.w)),
            child: Icon(
              icon,
              size: isHovered ? 22.sp : 25.sp,
              color: AppColors.colorAppbarText,
            )),
      );
    });
  }


}
