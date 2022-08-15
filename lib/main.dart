import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/pages/home_page.dart';
import 'package:valoinfos/provider/locale_provider.dart';
import 'package:valoinfos/utilities/style.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('tr'), Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('tr'),
      saveLocale: false,
      useFallbackTranslations: true,
      startLocale: const Locale('tr'),
      child: ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Valorant Info',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Style().primaryColor,
            ),
            scaffoldBackgroundColor: Style().primaryColor,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
