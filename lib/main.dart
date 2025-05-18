import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/presentation/widgets/app_widget.dart';
import 'package:petto/firebase_options.dart';
import 'package:petto/preferences/shared/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/lang',
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(392.7, 872.7),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ProviderScope(
            overrides: [
              sharedPreferencesProvider.overrideWithValue(sharedPrefs),
            ],
            child: child!,
          );
        },
        child: const AppWidget(),
      ),
    ),
  );
}
