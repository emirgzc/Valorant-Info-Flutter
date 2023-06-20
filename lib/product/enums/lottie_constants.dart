enum LottieConstants {
  loading('loading'),
  error('error'),
  rate('rate'),
  ;

  final String value;

  const LottieConstants(this.value);

  String get toLottie => 'assets/lottie/$value.json';
}
