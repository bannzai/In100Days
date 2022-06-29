enum Flavor {
  DEV,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return '100日後に-dev';
      case Flavor.PROD:
        return '100日後に';
      default:
        return 'title';
    }
  }

}
