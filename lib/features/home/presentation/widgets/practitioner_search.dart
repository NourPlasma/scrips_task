import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_colors.dart';
import 'package:scrips_task/generated/l10n.dart';

class PractitionerSearch extends StatelessWidget {
  const PractitionerSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.colorAppbarHover3,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 18.w,
          ),
          Icon(Icons.search, color: AppColors.colorAppbarHover2, size: 14.sp),
          SizedBox(
            width: 11.w,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 12.h),
                  border: InputBorder.none,
                  hintText: S.of(context).searchHint,
                hintStyle: TextStyle(
                  color: AppColors.colorAppbarHover2,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )
              ),
              style: TextStyle(
                color: AppColors.colorAppbarText,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
