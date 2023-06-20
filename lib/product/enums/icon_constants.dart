enum IconConstants {
  play('play'),
  back('back'),
  list('list'),
  info('info'),
  settings('settings'),
  gun('gun'),
  char('char'),
  pause('pause'),
  pencil('pencil'),
  ;

  final String value;

  const IconConstants(this.value);

  String get toIcon => 'assets/icons/$value.svg';
}
