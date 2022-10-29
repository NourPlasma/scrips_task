import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_constats.dart';
import 'package:scrips_task/core/widgets/on_hover.dart';
import 'package:scrips_task/core/constants/app_assets.dart';
import 'package:scrips_task/core/constants/app_colors.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_events.dart';
import 'package:scrips_task/generated/l10n.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_states.dart';

class PractitionerFilter extends StatelessWidget {
  const PractitionerFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      child: ListView(
        padding: EdgeInsets.only(right: 20.w),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: AppColors.colorBorder, width: 1)),
            child: TableCalendar(
              rowHeight: 50.h,
              headerStyle: HeaderStyle(titleCentered: true),
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                color: AppColors.colorBlack,
                shape: BoxShape.circle,
              )),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              S.of(context).soonestAvailability,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.colorAppbarText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Text(
                S.of(context).time,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorAppbarText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Spacer(),
              BlocBuilder<HomeBloc, HomeStates>(
                builder: (context, state) {
                  double rangeStart = HomeBloc.get(context).rangeStart;
                  double rangeEnd = HomeBloc.get(context).rangeEnd;
                  return Text(
                    '${S.of(context).from} ${rangeStart.toInt()}:00 ${S.of(context).to} ${rangeEnd.toInt()}:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.colorAppbarText,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              var rangeStart = HomeBloc.get(context).rangeStart;
              var rangeEnd = HomeBloc.get(context).rangeEnd;
              return SfRangeSliderTheme(
                data: SfRangeSliderThemeData(
                  activeTrackHeight: 2.h,
                  inactiveTrackHeight: 1.h,
                ),
                child: SfRangeSlider(
                  min: 0,
                  max: 24,
                  endThumbIcon: Image.asset(
                    AppAssets.rangeIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  startThumbIcon: Image.asset(
                    AppAssets.rangeIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  activeColor: AppColors.colorAppbarText,
                  inactiveColor: AppColors.colorAppbarHover2,
                  values: SfRangeValues(rangeStart, rangeEnd),
                  onChanged: (SfRangeValues value) =>
                      _updateRange(context, value),
                ),
              );
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              String availabilityFilter =
                  HomeBloc.get(context).availabilityFilter;
              String locationFilter = HomeBloc.get(context).locationFilter;
              String typeFilter = HomeBloc.get(context).typeFilter;
              return Column(
                children: [
                  Row(
                    children: [
                      _buildFilterItem(
                        text: S.of(context).all,
                        onTap: () => _updateFilter(
                            context, 'All', locationFilter, typeFilter),
                        isSelected: availabilityFilter == 'All' ? true : false,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItem(
                        onTap: () => _updateFilter(context, 'General Practice',
                            locationFilter, typeFilter),
                        text: S.of(context).generalPractice,
                        isSelected: availabilityFilter == 'General Practice'
                            ? true
                            : false,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItem(
                        onTap: () => _updateFilter(
                            context, 'OB-GYN', locationFilter, typeFilter),
                        text: S.of(context).oBGYN,
                        isSelected:
                            availabilityFilter == 'OB-GYN' ? true : false,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItem(
                        onTap: () => _updateFilter(
                            context, 'ENT', locationFilter, typeFilter),
                        text: S.of(context).eNT,
                        isSelected: availabilityFilter == 'ENT' ? true : false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      _buildFilterItem(
                        onTap: () => _updateFilter(context, 'Physiotherapy',
                            locationFilter, typeFilter),
                        text: S.of(context).physiotherapy,
                        isSelected: availabilityFilter == 'Physiotherapy'
                            ? true
                            : false,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItem(
                        onTap: () => () {},
                        text: '+ 3 ${S.of(context).more}',
                        isSelected: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).location,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.colorAppbarText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(context,
                              availabilityFilter, 'Office', typeFilter),
                          isSelected: locationFilter == 'Office' ? true : false,
                          text: S.of(context).office,
                          icon: Icons.add_box_rounded),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(
                              context, availabilityFilter, 'Home', typeFilter),
                          isSelected: locationFilter == 'Home' ? true : false,
                          text: S.of(context).home,
                          icon: Icons.home),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(context,
                              availabilityFilter, 'Virtual', typeFilter),
                          isSelected:
                              locationFilter == 'Virtual' ? true : false,
                          text: S.of(context).virtual,
                          icon: Icons.video_call),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.colorAppbarText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(context,
                              availabilityFilter, locationFilter, 'First time'),
                          isSelected: typeFilter == 'First time' ? true : false,
                          text: S.of(context).firstTime,
                          icon: Icons.one_x_mobiledata),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(context,
                              availabilityFilter, locationFilter, 'Follow Up'),
                          isSelected: typeFilter == 'Follow Up' ? true : false,
                          text: S.of(context).followUp,
                          icon: Icons.settings_backup_restore),
                      SizedBox(
                        width: 8.w,
                      ),
                      _buildFilterItemWithIcon(
                          onTap: () => _updateFilter(context,
                              availabilityFilter, locationFilter, 'Walk In'),
                          isSelected: typeFilter == 'Walk In' ? true : false,
                          text: S.of(context).walkIn,
                          icon: Icons.directions_walk),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).practice} 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.colorAppbarText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                color: AppColors.colorBlack,
                borderRadius: BorderRadius.circular(8.w)),
            width: 256.w,
            height: 48.h,
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    AppAssets.dummyHospital,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Primary Clinic Dubai',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
                border: Border.all(color: AppColors.colorBorder, width: 1),
                borderRadius: BorderRadius.circular(8.w)),
            width: 256.w,
            height: 48.h,
            child: Text(
              S.of(context).showAll,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.colorAppbarText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  _buildFilterItem(
      {required String text,
      required bool isSelected,
      required GestureTapCallback? onTap}) {
    return OnHover(builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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

  _buildFilterItemWithIcon(
      {required String text,
        required bool isSelected,
        required IconData icon,
        required GestureTapCallback? onTap}) {
    return OnHover(builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorBorder, width: 1.h),
                color: isHovered || isSelected ? AppColors.colorBlack : null,
                borderRadius: BorderRadius.circular(8.w)),
            child: Center(
              child: Row(
                children: [
                  Icon(icon,
                      color: isHovered || isSelected
                          ? AppColors.colorWhite
                          : AppColors.colorAppbarText,
                      size: 12.sp),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
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
                ],
              ),
            )),
      );
    });
  }


  _updateRange(BuildContext context, SfRangeValues value) {
    HomeBloc.get(context).add(UpdateRange(value.start, value.end));
  }

  _updateFilter(BuildContext context, String availabilityFilter,
      String locationFilter, String typeFilter) {
    HomeBloc.get(context)
        .add(UpdateFilter(locationFilter, availabilityFilter, typeFilter));
  }
}
