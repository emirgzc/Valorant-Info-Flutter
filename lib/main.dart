import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/product/utilities/locator.dart';
import 'package:valoinfos/product/utilities/style.dart';
import 'package:valoinfos/route_generator.dart';
import 'package:valoinfos/product/utilities/translations/codegen_loader.g.dart';
import 'package:valoinfos/product/viewmodels/data_view_model.dart';
import 'package:valoinfos/product/widgets/packages/shimmer/shimmer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataViewModel(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        useOnlyLangCode: true,
        fallbackLocale: const Locale('tr'),
        assetLoader: const CodegenLoader(),
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
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Shimmer(
          linearGradient: Style.shimmerGradient(),
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Valorant Info',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
                foregroundColor: Style.darkTextColor,
                backgroundColor: Style.whiteColor,
              ),
              scaffoldBackgroundColor: Style.whiteColor,
            ),
            onGenerateRoute: RouteGenerator.routeGenrator,
          ),
        );
      },
    );
  }
}

//keytool -export -rfc -alias key0 -file keyValorant.pem -keystore keyValorant.jks  