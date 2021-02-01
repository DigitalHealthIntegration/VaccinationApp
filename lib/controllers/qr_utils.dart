class QrUtils {  
  static dynamic getInfoFromQR(String couponString) {
    if (couponString.contains("/pub_key?"))
      couponString =
          couponString.substring(couponString.indexOf("/pub_key?") + 9);
    Map qrMap = new Map();
    var arr = couponString.split("&");
    for (var i = 0; i < arr.length; i++) {
      String str = arr[i];
      var local = str.split("=");
      qrMap.putIfAbsent(local[0], () => local[1]);

    }
    return qrMap;
  }
}
