
class AppAssets {
  static String patients = 'patients'.png;
  static String notification = 'notification'.png;
  static String logo = 'logo'.png;
  static String help = 'help'.png;
  static String dashboard = 'dashboard'.png;
  static String clinical = 'clinical'.png;
  static String calendar = 'calendar'.png;
  static String billing = 'billing'.png;
  static String rangeIcon = 'range_icon'.png;


  //dummy images
  static String dummyHospital = 'dummy_hospital'.png;
  static String profileDummy = 'profile_dummy'.png;
  static String profileDummy2 = 'profile_dummy2'.png;

}

extension ImageUrl on String {
  String get png => 'assets/$this.png';
  String get svg => 'assets/$this.svg';
  String get jpeg => 'assets/$this.jpeg';
}