import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/model/char_one_api_model.dart';
import 'package:valoinfos/pages/sound.dart';
import 'package:valoinfos/provider/locale_provider.dart';
import 'package:valoinfos/utilities/reklam.dart';
import 'package:valoinfos/utilities/style.dart';

class CharDetailPage extends StatefulWidget {
  CharDetailPage({Key? key, required this.charUidd}) : super(key: key) {
    _initAd();
  }
  final String charUidd;

  @override
  State<CharDetailPage> createState() => _CharDetailPageState();
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  void _initAd() {
    InterstitialAd.load(
      adUnitId: reklamGecis,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    isAdLoaded = true;

    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        interstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        interstitialAd.dispose();
      },
    );
  }
}

class _CharDetailPageState extends State<CharDetailPage> {
  ApiClient apiClient = ApiClient();
  Data? datal;
  int indexAbi = 0;

  EdgeInsets defPad = EdgeInsets.symmetric(horizontal: 60.w, vertical: 24.h);

  @override
  void initState() {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: false).locale;
    apiClient
        .getDetailForChar(
          widget.charUidd,
          languageCode,
        )
        .then(
          (value) => {
            setState(() {
              datal = value;
            })
          },
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var languageCode =
        Provider.of<LanguageProvider>(context, listen: true).locale;

    return Scaffold(
      appBar: getCharDetAppBar(context, datal),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ApiClient().getDetailForChar(widget.charUidd, languageCode),
          builder: (context, snapshot) {
            // var datasChar = snapshot.data as Data?;
            if (snapshot.hasData && snapshot.data != null) {
              var datas = snapshot.data as Data?;

              return getDetailCharBody(datas);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget getDetailCharBody(Data? datas) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 40.w,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(
                      int.parse(
                        "0xff${datas?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}",
                      ),
                    ),
                    Color(
                      int.parse(
                        "0xff${datas?.backgroundGradientColors![1].substring(0, 6) ?? 0xff}",
                      ),
                    ),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: BorderedText(
                      strokeWidth: 2,
                      strokeColor: Color(
                        int.parse(
                          "0xff${datas?.backgroundGradientColors![1].substring(0, 6) ?? 0xff}",
                        ),
                      ).withOpacity(0.25),
                      child: Text(
                        datas?.displayName.toString() ?? "",
                        style: TextStyle(
                          color: Color(
                            int.parse(
                              "0xff${datas?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}",
                            ),
                          ),
                          fontSize: 180.sp,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Color(
                                int.parse(
                                  "0xff${datas?.backgroundGradientColors![1].substring(0, 6) ?? 0xff}",
                                ),
                              ).withOpacity(0.25),
                              offset: const Offset(5, 5),
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: datas?.background == null
                        ? Container()
                        : SizedBox(
                            height: 500.h,
                            child: Image.network(
                              datas!.background.toString(),
                              fit: BoxFit.cover,
                              color: Style().textColor,
                            ),
                          ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 700.h,
                      child: datas?.displayName.toString() == "FADE" ||
                              datas?.displayName.toString() == "Fade"
                          ? Image.asset("assets/char/fade.webp")
                          : datas?.displayName.toString() == "BREACH" ||
                                  datas?.displayName.toString() == "Breach"
                              ? Image.asset("assets/char/breach.webp")
                              : datas?.displayName.toString() == "RAZE" ||
                                      datas?.displayName.toString() == "Raze"
                                  ? Image.asset("assets/char/raze.webp")
                                  : datas?.displayName.toString() == "CHAMBER" ||
                                          datas?.displayName.toString() ==
                                              "Chamber"
                                      ? Image.asset("assets/char/chamber.webp")
                                      : datas?.displayName.toString() == "KAY/O" ||
                                              datas?.displayName.toString() ==
                                                  "Kay/o"
                                          ? Image.asset("assets/char/kayo.webp")
                                          : datas?.displayName.toString() == "SKYE" ||
                                                  datas?.displayName.toString() ==
                                                      "Skye"
                                              ? Image.asset(
                                                  "assets/char/skye.webp")
                                              : datas?.displayName.toString() ==
                                                          "CYPHER" ||
                                                      datas?.displayName.toString() ==
                                                          "Cypher"
                                                  ? Image.asset(
                                                      "assets/char/cypher.webp")
                                                  : datas?.displayName.toString() == "SOVA" ||
                                                          datas?.displayName.toString() ==
                                                              "Sova"
                                                      ? Image.asset(
                                                          "assets/char/sova.webp")
                                                      : datas?.displayName.toString() ==
                                                                  "KILLJOY" ||
                                                              datas?.displayName.toString() ==
                                                                  "Killjoy"
                                                          ? Image.asset("assets/char/killjoy.webp")
                                                          : datas?.displayName.toString() == "VIPER" || datas?.displayName.toString() == "Viper"
                                                              ? Image.asset("assets/char/viper.webp")
                                                              : datas?.displayName.toString() == "PHOENIX" || datas?.displayName.toString() == "Phoenix"
                                                                  ? Image.asset("assets/char/phoenix.webp")
                                                                  : datas?.displayName.toString() == "ASTRA" || datas?.displayName.toString() == "Astra"
                                                                      ? Image.asset("assets/char/astra.webp")
                                                                      : datas?.displayName.toString() == "BRIMSTONE" || datas?.displayName.toString() == "Brimstone"
                                                                          ? Image.asset("assets/char/brim.webp")
                                                                          : datas?.displayName.toString() == "NEON" || datas?.displayName.toString() == "Neon"
                                                                              ? Image.asset("assets/char/neon.webp")
                                                                              : datas?.displayName.toString() == "YORU" || datas?.displayName.toString() == "Yoru"
                                                                                  ? Image.asset("assets/char/yoru.webp")
                                                                                  : datas?.displayName.toString() == "SAGE" || datas?.displayName.toString() == "Sage"
                                                                                      ? Image.asset("assets/char/sage.webp")
                                                                                      : datas?.displayName.toString() == "REYNA" || datas?.displayName.toString() == "Reyna"
                                                                                          ? Image.asset("assets/char/reyna.webp")
                                                                                          : datas?.displayName.toString() == "OMEN" || datas?.displayName.toString() == "Omen"
                                                                                              ? Image.asset("assets/char/omen.webp")
                                                                                              : datas?.displayName.toString() == "JETT" || datas?.displayName.toString() == "Jett"
                                                                                                  ? Image.asset("assets/char/jett.webp")
                                                                                                  : Image.asset("assets/char/no.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.h, left: 60.w),
          child: Row(
            children: [
              Text(
                datas?.displayName.toString() ?? "",
                style: TextStyle(
                  color: Color(
                    int.parse(
                      "0xff${datas?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}",
                    ),
                  ),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: defPad,
          child: Text(
            datas?.description.toString() ?? "",
            style: TextStyle(
              color: Style().textColor,
              fontSize: 48.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, left: 60.w),
          child: Row(
            children: [
              Text(
                datas?.role!.displayName.toString() ?? "",
                style: TextStyle(
                  color: Color(
                    int.parse(
                      "0xff${datas?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}",
                    ),
                  ),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: defPad,
          child: Wrap(
            spacing: 30.r,
            alignment: WrapAlignment.start,
            children: [
              ...List.generate(
                datas?.abilities?.length ?? 0,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexAbi = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 40.h,
                      ),
                      height: 180.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: index == indexAbi
                            ? Color(
                                int.parse(
                                  "0xff${datas?.backgroundGradientColors![0].substring(0, 6)}",
                                ),
                              )
                            : Style().primaryColor,
                        borderRadius: index == indexAbi
                            ? BorderRadius.circular(30.r)
                            : BorderRadius.zero,
                      ),
                      child: datas?.abilities![index].displayIcon == null
                          ? Image.asset("assets/char/no.png")
                          : Image.network(
                              datas?.abilities![index].displayIcon.toString() ??
                                  "",
                              fit: BoxFit.contain,
                              color: index != indexAbi
                                  ? Color(
                                      int.parse(
                                        "0xff${datas?.backgroundGradientColors![0].substring(0, 6)}",
                                      ),
                                    )
                                  : Color(
                                      int.parse(
                                        "0xff${datas?.backgroundGradientColors![1].substring(0, 6)}",
                                      ),
                                    ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 60.w,
            top: 30.h,
            bottom: 100.h,
          ),
          child: Text(
            datas?.abilities![indexAbi].description.toString() ?? "",
            style: TextStyle(
              color: Style().textColor,
              fontSize: 48.sp,
            ),
          ),
        ),
      ],
    );
  }

  AppBar getCharDetAppBar(BuildContext context, Data? datas) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(
                int.parse(
                  "0xff${datas?.backgroundGradientColors![0].substring(0, 6) ?? 0xff}",
                ),
              ),
              Color(
                int.parse(
                  "0xff${datas?.backgroundGradientColors![1].substring(0, 6) ?? 0xff}",
                ),
              ),
            ],
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Style().iconColor,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: GestureDetector(
            onTap: () {
              if (widget.isAdLoaded) {
                widget.interstitialAd.show();
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SoundPage(
                    sound:
                        datas?.voiceLine!.mediaList![0].wave.toString() ?? "",
                    imageBack: datas?.bustPortrait.toString() ?? "",
                    imageBack2: datas?.background.toString() ?? "",
                    color: datas?.backgroundGradientColors![0].toString() ?? "",
                  ),
                ),
              );
            },
            child: Icon(
              Icons.play_circle_outline,
              color: Style().iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
