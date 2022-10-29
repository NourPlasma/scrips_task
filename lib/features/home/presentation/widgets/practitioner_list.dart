import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/widgets/on_hover.dart';
import 'package:scrips_task/core/constants/app_assets.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_events.dart';
import 'package:scrips_task/generated/l10n.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_states.dart';

class PractitionerList extends StatelessWidget {
  const PractitionerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 24.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '30 ${S.of(context).practitioners}x',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.colorAppbarText,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1)),
                    child: BlocBuilder<HomeBloc, HomeStates>(
                      builder: (context, state) {
                        var isDoctors = HomeBloc.get(context).isDoctors;
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => _toggleSearchFilter(context,true),
                              child: Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    border: Border.all(
                                        color: AppColors.colorBorder, width: isDoctors ? 2 : 0)),
                                child: Text(S.of(context).doctors,
                                    style: TextStyle(
                                      color: AppColors.colorAppbarText,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _toggleSearchFilter(context,false),
                              child: Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    border: Border.all(
                                        color: AppColors.colorBorder, width: isDoctors ? 0 : 2)),
                                child: Text('Nurses',
                                    style: TextStyle(
                                      color: AppColors.colorAppbarText,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeStates>(
                  builder: (context, state) {
                    var isMenuOpened = HomeBloc
                        .get(context)
                        .isMenuOpened;
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isMenuOpened ? 2 : 3,
                            childAspectRatio: (1 / 0.35),
                            mainAxisSpacing: 5.w,
                            crossAxisSpacing: 5.h
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return _buildItem(context);
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }


  Container _buildItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: AppColors.colorBorder, width: 1)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Spacer(),
              OnHover(builder: (isHovered) {
                return GestureDetector(
                  onTap: ()=> _selectPractitioner(context),
                  child: Container(
                      width: 54.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.colorBorder, width: 1.h),
                          color: isHovered ? AppColors.colorBlack : null,
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Center(
                        child: Text(
                          S.of(context).select,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isHovered
                                ? AppColors.colorWhite
                                : AppColors.colorAppbarText,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                );
              }),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            '2 ${S.of(context).shifts}:  9:00a - 1:00p  •  5:00a - 7:00p',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.colorAppbarText,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            '20 office slots on May 22',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.colorAppbarText,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Text(
                '${S.of(context).next}:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorAppbarText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              OnHover(builder: (isHovered) {
                return Container(
                    width: 39.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1.h),
                        color: isHovered ? AppColors.colorBlack : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Center(
                      child: Text(
                        '8:30a',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ));
              }),
              SizedBox(
                width: 3.w,
              ),
              OnHover(builder: (isHovered) {
                return Container(
                    width: 39.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1.h),
                        color: isHovered ? AppColors.colorBlack : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Center(
                      child: Text(
                        '2:00p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ));
              }),
              SizedBox(
                width: 3.w,
              ),
              OnHover(builder: (isHovered) {
                return Container(
                    width: 39.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1.h),
                        color: isHovered ? AppColors.colorBlack : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Center(
                      child: Text(
                        '2:30p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ));
              }),
              SizedBox(
                width: 3.w,
              ),
              OnHover(builder: (isHovered) {
                return Container(
                    width: 39.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1.h),
                        color: isHovered ? AppColors.colorBlack : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Center(
                      child: Text(
                        '3:30p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ));
              }),
              SizedBox(
                width: 3.w,
              ),
              OnHover(builder: (isHovered) {
                return Container(
                    width: 39.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.colorBorder, width: 1.h),
                        color: isHovered ? AppColors.colorBlack : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Center(
                      child: Text(
                        '4:30p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ));
              }),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSearchFilter(BuildContext context,bool isDoctors) {
    HomeBloc.get(context).add(ToggleSearchFilter(isDoctors ? 'doctors' : 'nurses'));
  }

  void _selectPractitioner(BuildContext context) {
    HomeBloc.get(context).add(SelectPractitioner());
  }
}
