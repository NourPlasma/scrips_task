import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_assets.dart';
import 'package:scrips_task/core/constants/app_colors.dart';
import 'package:scrips_task/generated/l10n.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorBlack,
      width: 56.w,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 32.h, left: 12.w, right: 12.w),
            child: Image.asset(
              AppAssets.logo,
              width: 32.w,
              height: 32.h,
            ),
          ),
          _buildMenuIcon(text: S.of(context).dashboard, name: AppAssets.dashboard),
          _buildMenuIcon(text: S.of(context).calendar, name: AppAssets.calendar),
          _buildMenuIcon(text: S.of(context).clinical, name: AppAssets.clinical),
          _buildMenuIcon(text: S.of(context).patients, name: AppAssets.patients),
          _buildMenuIcon(text: S.of(context).billing, name: AppAssets.billing),
          const Spacer(),
          _buildNotificationIcon(context),
          _buildMenuIcon(text: S.of(context).help, name: AppAssets.help),
          Container(
            padding: EdgeInsets.only(top: 30.h, left: 9.w, right: 9.w,bottom: 30.h),
            child: ClipOval(
              child: Image.asset(
                AppAssets.profileDummy,
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon({
    required String name,
    required String text,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 30.h),
      child: Column(
        children: [
          Image.asset(
            name,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.colorWhite,
                fontWeight: FontWeight.w700,
                fontSize: 9.sp),
          )
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 30.h),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                width: 40.w,
                height: 40.h,
                child: Image.asset(
                  AppAssets.notification,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.colorNotification),
                  child: Text(
                    '34',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp),
                  ),
                ),
              )
            ],
          ),
          Text(
           S.of(context).notification,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.colorWhite,
                fontWeight: FontWeight.w700,
                fontSize: 9.sp),
          )
        ],
      ),
    );
  }
}
