import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_colors.dart';
import 'package:scrips_task/core/constants/app_constats.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_events.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_states.dart';

import '../../../../core/widgets/on_hover.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../generated/l10n.dart';

class CreateAppointment extends StatelessWidget {
  const CreateAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        bool isMenuOpened = HomeBloc.get(context).isMenuOpened;
        bool isPractitionerSelected =
            HomeBloc.get(context).isPractitionerSelected;
        var appointmentFilter = HomeBloc.get(context).appointmentFilter;
        return isMenuOpened
            ? Container(
                color: AppColors.colorWhite,
                width: 400.w,
                height: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 32.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                S.of(context).createAppointment,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.colorAppbarText,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              AppConst.buildHoverIcon(
                                  icon: Icons.arrow_back_ios_new,
                                  onTap: () => _toggleMenu(context)),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppConst.buildHoverIcon(
                                  icon: Icons.remove, onTap: () => () {}),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppConst.buildHoverIcon(
                                  icon: Icons.close, onTap: () => () {}),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                              ),
                              _buildFilterItem(
                                onTap: ()=> _updateAppointmentFilter(context,'General'),
                                text: S.of(context).general,
                                isSelected: appointmentFilter == 'General' ? true : false,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              _buildFilterItem(
                                onTap: ()=>_updateAppointmentFilter(context,'Group'),
                                text: S.of(context).group,
                                  isSelected: appointmentFilter == 'Group' ? true : false,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              _buildFilterItem(
                                onTap: ()=>_updateAppointmentFilter(context,'Block Slot'),
                                text: S.of(context).blockSlot,
                                isSelected: appointmentFilter == 'Block Slot' ? true : false,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              _buildFilterItem(
                                onTap: ()=>_updateAppointmentFilter(context,'Advanced'),
                                text: S.of(context).advanced,
                                isSelected: appointmentFilter == 'Advanced' ? true : false,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              _buildFilterItem(
                                onTap: ()=>_updateAppointmentFilter(context,'Walk In'),
                                text: S.of(context).walkIn,
                                isSelected: appointmentFilter == 'Walk In' ? true : false,
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          isPractitionerSelected
                              ? _buildPractitionerItem(
                                  context: context,
                                  name: 'Mark Black',
                                  dec: 'General Practice')
                              : Container(),
                          isPractitionerSelected
                              ? Container()
                              : _buildListItem(
                                  text: S.of(context).practitioner, isSelected: true),
                          _buildListItem(
                              text: S.of(context).profileDateTime,
                              isSelected:
                                  isPractitionerSelected ? true : false),
                          _buildListItem(
                              text: S.of(context).servicesPayment, isSelected: false),
                          _buildListItem(text: S.of(context).patient, isSelected: false),
                          _buildListItem(text: S.of(context).notes, isSelected: false),
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            height: 48.h,
                            color: isPractitionerSelected
                                ? AppColors.colorBlack
                                : AppColors.colorAppbarHover3,
                            child: Center(
                              child: Text(
                                S.of(context).create,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isPractitionerSelected
                                      ? AppColors.colorWhite
                                      : AppColors.colorAppbarHover2,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 1.w,
                      color: AppColors.colorAppbarText.withAlpha(50),
                    )
                  ],
                ),
              )
            : Container();
      },
    );
  }


  _buildListItem({
    required String text,
    required bool isSelected,
  }) {
    return OnHover(builder: (isHovered) {
      return Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: AppColors.colorBorder, width: 1.h)),
            color: isHovered || isSelected ? AppColors.colorAppbarHover : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24.w,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorAppbarText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.add,
                size: 15.w,
                color: AppColors.colorAppbarText,
              ),
              SizedBox(
                width: 24.w,
              ),
              isSelected
                  ? Container(
                      height: double.infinity,
                      width: 2,
                      color: AppColors.colorBlack,
                    )
                  : Container(),
            ],
          ));
    });
  }

  _buildPractitionerItem({
    required String name,
    required BuildContext context,
    required String dec,
  }) {
    return OnHover(builder: (isHovered) {
      return Container(
          width: double.infinity,
          height: 88.h,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: AppColors.colorBorder, width: 1.h)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    S.of(context).practitioner,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.colorAppbarText,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const Spacer(),
                  OnHover(builder: (isBtnHovered) {
                    return GestureDetector(
                      onTap: () => _removeSelection(context),
                      child: Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              color: isBtnHovered
                                  ? AppColors.colorAppbarHover
                                  : null,
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Icon(
                            Icons.remove,
                            size: 15.sp,
                            color: AppColors.colorAppbarText,
                          )),
                    );
                  }),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
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
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAppbarText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        dec,
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
                    return Container(
                        width: 42.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.colorBorder, width: 1.h),
                            color: isHovered ? AppColors.colorBlack : null,
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Center(
                          child: Text(
                            S.of(context).coVisit,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isHovered
                                  ? AppColors.colorWhite
                                  : AppColors.colorAppbarText,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ));
                  }),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              )
            ],
          ));
    });
  }

  _buildFilterItem({
    required String text,
    required bool isSelected,
    required GestureTapCallback? onTap
  }) {
    return OnHover(builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 65.w,
            height: 35.h,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorBorder, width: 1.h),
                color: isHovered || isSelected ? AppColors.colorBlack : null,
                borderRadius: BorderRadius.circular(8.w)),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isHovered || isSelected
                      ? AppColors.colorWhite
                      : AppColors.colorAppbarText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            )),
      );
    });
  }

  _toggleMenu(BuildContext context) {
    HomeBloc.get(context).add(ToggleMenu());
  }

  _removeSelection(BuildContext context) {
    HomeBloc.get(context).add(RemovePractitioner());
  }

  _updateAppointmentFilter(BuildContext context, String filter) {
    HomeBloc.get(context).add(UpdateAppointmentFilter(filter));
  }
}
