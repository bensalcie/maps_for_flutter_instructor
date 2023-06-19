import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_for_flutter/home/features/maps/presentation/pages/maps_home_page.dart';

void  main() {
   /// [testWidgets] should test Add order widgets.
  ///
  ///
  ///\
  ///
  Widget initWidget({required Widget widget}) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: widget));
  }

  /// Test if map was displayed correctly.
  testWidgets('should show only one map widget',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final widget = initWidget(widget: MapsHomePage());
    await tester.pumpWidget(widget);

    // await tester.pumpWidget(const AddSingleOrderPage());
    await tester.pump(const Duration(microseconds: 500));
//Finds one widget of type Google Map
    expect(find.byType(GoogleMap), findsOneWidget);

    //Finds one map on screen.
    expect(find.byKey(const Key('maps-widget')), findsOneWidget);
    //



  });
}