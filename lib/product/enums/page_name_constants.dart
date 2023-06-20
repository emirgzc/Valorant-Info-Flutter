enum PageNameConstants {
  charDetailPage('charDetailPage'),
  charPage('charPage'),
  compPage('compPage'),
  gunDetailPage('gunDetailPage'),
  gunPage('gunPage'),
  gunSkinDetailPage('gunSkinDetailPage'),
  gunSkinPage('gunSkinPage'),
  homePage('homePage'),
  mapPage('mapPage'),
  newsPage('newsPage'),
  otherPage('otherPage'),
  settingsPage('settingsPage'),
  wayPage('wayPage'),
  soundPage('soundPage'),
  video('video'),
  landPage('landPage'),
  ;

  final String value;

  const PageNameConstants(this.value);

  String get pageName => '/$value';
}
