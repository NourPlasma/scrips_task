import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrips_task/core/bloc/core_bloc.dart';
import 'package:scrips_task/core/bloc/core_states.dart';
import 'core/constants/app_constats.dart';
import 'core/constants/app_fonts.dart';
import 'core/route/app_route_paths.dart';
import 'core/route/router.dart';
import 'di/injection_container.dart' as di;
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var bloc = di.sl<CoreBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoreBloc>(
      create: (context) => bloc,
      child: BlocBuilder<CoreBloc, CoreStates>(
        builder: (context, state) {
          Locale locale = bloc.currentLocal;
          return ScreenUtilInit(
            designSize: Size(1440,944),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConst.currentAppName,
                theme: ThemeData(
                  fontFamily: Fonts.roboto,
                ),
                // locale specific
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                onGenerateRoute: MyRouter.generateRoute,
                initialRoute: getInitialRoute(context),
                locale: locale,
                supportedLocales: S.delegate.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }

  String getInitialRoute(BuildContext context) {
    return AppRoutePaths.Home;
  }
}
