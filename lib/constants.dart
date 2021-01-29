class Texts {
  static const String AcceptLabel = "OK";
  static const String CloseLabel = "Close";
  static const String DenyLabel = "Cancel";
}

class PageTitles {
  static const String Administrator = "ADMINISTRATOR";
  static const String VaccineRecognized = "VACCINE RECOGNIZED";
  
}

class AppRoutes {
  static const String InitialLogin = "/";
  static const String SecondLogin = "/secondlogin";

  static const String Location = "/location";
  static const String Administrator = "/location/administrator";
  static const String ScanQr = "/location/administrator/scanqr";
  static const String VaccineRecognized =
      "/location/administrator/scanqr/vaccinerecognized";
}

class GlobalValues {
  static String qrCodeKey = "60'#(bpzHDLRSB;\"rA!k3?.wB'L@o#(U";
}
