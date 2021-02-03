// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter_r1/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_r1/controllers/qr_utils.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    String couponString =
        "healthpass:SHA256\ruBip0i3d6aovFPuBPocSpurs7vXfedVjPjBhCuSP9NIHGwkt3L1LQWEHuFpx2sFQhFdu31npoLQgkHnRi51aF/DlYLAABZRBnFesWtyI+UA2kYQCFoMOR3qs1Sn6XisF5ukI/rwI5mOn0t5w+VhmCUhxtMhXKmfe1MM8uWX/po=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=coupon&phase=123&conditions=abc";
    Map decodeMap = QrUtils.getInfoFromQR(Uri.decodeFull(couponString));
    expect(decodeMap.toString(), "{type: coupon, phase: 123, conditions: abc}");

    String couponString2 =
        "healthpass:SHA256\KvjzblZPVd6HQugVLd9vS3nRqAyKmOxcnUm2VfSvo9eJGRYV2hP1mYgnUM481pHBXLtUI0wYGX3DsmSHumxHQe+IMOdVWP/FTarJIJCN67YtRP6r0FMxfucbxINQOgxs5QWi+i0E1xToPsA0/EaL0FA2HFL6FMdv4i/JgRUGd/Y=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=coupon&age=a%20b";
    couponString2 = Uri.decodeFull(couponString2);
    Map decodeMap2 = QrUtils.getInfoFromQR(couponString2);
    expect(decodeMap2.toString(), "{type: coupon, age: a b}");

    var encoded =
        "healthpass:SHA256\KvjzblZPVd6HQugVLd9vS3nRqAyKmOxcnUm2VfSvo9eJGRYV2hP1mYgnUM481pHBXLtUI0wYGX3DsmSHumxHQe+IMOdVWP/FTarJIJCN67YtRP6r0FMxfucbxINQOgxs5QWi+i0E1xToPsA0/EaL0FA2HFL6FMdv4i/JgRUGd/Y=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=coupon&age=a%20b";
    // var encoded = Uri.encodeFull(uri);
    // assert(encoded == 'http://example.org/api?foo=some%20message');

    var decoded = Uri.decodeFull(encoded);
    String output =
        "healthpass:SHA256KvjzblZPVd6HQugVLd9vS3nRqAyKmOxcnUm2VfSvo9eJGRYV2hP1mYgnUM481pHBXLtUI0wYGX3DsmSHumxHQe+IMOdVWP/FTarJIJCN67YtRP6r0FMxfucbxINQOgxs5QWi+i0E1xToPsA0/EaL0FA2HFL6FMdv4i/JgRUGd/Y=@vitorpamplona.com/vaccine-certificate-qrcode-generator/pub_key?type=coupon&age=a b";
    assert(decoded == output);
  });
}
