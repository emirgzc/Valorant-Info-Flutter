enum LogoConstants {
  v1('v1'),
  v2('v2'),
  ;

  final String value;

  const LogoConstants(this.value);

  String get toLogo => 'assets/logo/$value.svg';
}
