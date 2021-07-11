import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/core/ui/orientation_optional_widget.dart';

Widget getTestableOptionalWidget(Size screenSize) {
  return MediaQuery(
      data: MediaQueryData(size: screenSize),
      child: OrientationOptionalWidget(
        portrait: Text('portrait', textDirection: TextDirection.ltr),
        landscape: Text('landscape', textDirection: TextDirection.ltr),
      ));
}

void main() {
  Size landscapeSize = Size(600, 400);
  Size protraitSize = Size(400, 600);
  testWidgets(
      'should build the portrait widget when the orientation is portrait.',
      (WidgetTester tester) async {
    //act
    await tester.pumpWidget(getTestableOptionalWidget(protraitSize));

    //assert
    expect(find.text('portrait'), findsOneWidget);
    expect(find.text('landscape'), findsNothing);
  });

  testWidgets(
      'should build the landscape widget when the orientation is landscape.',
      (WidgetTester tester) async {
    //act
    await tester.pumpWidget(getTestableOptionalWidget(landscapeSize));

    //assert
    expect(find.text('landscape'), findsOneWidget);
    expect(find.text('portrait'), findsNothing);
  });
}
