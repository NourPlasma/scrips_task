import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_constats.dart';
import 'package:scrips_task/generated/l10n.dart';

import '../../../../core/widgets/on_hover.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';

class PractitionerProfile extends StatelessWidget {
  const PractitionerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              BlocBuilder<HomeBloc, HomeStates>(
                builder: (context, state) {
                  var isMenuOpened = HomeBloc.get(context).isMenuOpened;
                  return isMenuOpened
                      ? Container()
                      : Row(
                    children: [
                      AppConst.buildHoverIcon(
                          icon: Icons.arrow_forward_ios,
                          onTap: () => _toggleMenu(context)),
                      SizedBox(
                        width: 10.w,
                      ),
                      AppConst.buildHoverIcon(icon: Icons.remove, onTap: () => () {}),
                      SizedBox(
                        width: 10.w,
                      ),
                      AppConst.buildHoverIcon(icon: Icons.close, onTap: () => () {}),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  );
                },
              ),
              Text(
                S.of(context).profileDateTime,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorAppbarText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          OnHover(
            builder: (isHovered) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color :isHovered  ? AppColors.colorAppbarHover : null,
                    borderRadius: BorderRadius.circular(7.w),
                    border: Border.all(color: AppColors.colorBorder, width: 1)),
                width: double.infinity,
                height: 58.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        AppAssets.profileDummy2,
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mark Black',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.colorAppbarText,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'General Practice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.colorAppbarText,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    AppConst.buildHoverIcon(icon: Icons.remove,onTap: ()=>_removeSelection(context)),
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }

  _toggleMenu(BuildContext context) {
    HomeBloc.get(context).add(ToggleMenu());
  }


  _removeSelection(BuildContext context) {
    HomeBloc.get(context).add(RemovePractitioner());
  }
}
