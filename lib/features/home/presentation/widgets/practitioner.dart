import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/constants/app_constats.dart';
import 'package:scrips_task/features/home/presentation/widgets/practitioner_filter.dart';
import 'package:scrips_task/features/home/presentation/widgets/practitioner_list.dart';
import 'package:scrips_task/features/home/presentation/widgets/practitioner_search.dart';
import 'package:scrips_task/generated/l10n.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';

class Practitioner extends StatelessWidget {
  const Practitioner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                S.of(context).practitioner,
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
            height: 16.h,
          ),
          const PractitionerSearch(),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: Row(
              children: [
                const PractitionerFilter(),
                Container(
                  height: double.infinity,
                  width: 1.w,
                  color: AppColors.colorAppbarText.withAlpha(50),
                ),
                const SizedBox(),
                const PractitionerList(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  _toggleMenu(BuildContext context) {
    HomeBloc.get(context).add(ToggleMenu());
  }
}
