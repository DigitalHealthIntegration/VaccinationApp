class Texts {
  static const String AcceptLabel = "OK";
  static const String CloseLabel = "Close";
  static const String DenyLabel = "Cancel";
}

class PageTitles {
  static const String Administrator = "ADMINISTRATOR";
  static const String VaccineRecognized = "VACCINE RECOGNIZED";
  static const String RecordingDose = "RECORDING DOSE";
  static const String ScanResult = "COUPON VALID";
  static const String BadgesPrinting = "BADGES PRINTING";
  static const String PassKey = "PASSKEY";
  static const String Badge = "BADGE";
  static const String Status = "STATUS";
  static const String ShareQr = "SHARE QR";
}

class AppRoutes {
  static const String InitialLogin = "/root";
  static const String Location = "/root/location";
  static const String Administrator = "/root/location/administrator";
  static const String ScanQr = "/root/location/administrator/scanqr";
  static const String VaccineRecognized =
      "/root/location/administrator/scanqr/vaccinerecognized";

  static const String Home = "/home";
  static const String RecordingDose = "/home/recordingdose";
  static const String CouponScan = "/home/recordingdose/couponscan";
  static const String ScanResult = "/home/recordingdose/couponscan/scanresult";
  static const String AdministerReady =
      "/home/recordingdose/couponscan/scanresult/administerready";
  static const String BadgeProduction =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction";
  static const String BadgePrint =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction/badgeprint";
  static const String PassKey =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction/badgeprint/passkey";
  static const String Badge =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction/badgeprint/badge";
  static const String Status =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction/badgeprint/status";
  static const String ShareQr =
      "/home/recordingdose/couponscan/scanresult/administerready/badgeproduction/badgeprint/status/shareqr";
}

class GlobalValues {
  static String qrCodeKey = "60'#(bpzHDLRSB;\"rA!k3?.wB'L@o#(U";
}

class SharedPreferenceKeys {
  static String user = "user";
}
