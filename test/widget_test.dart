// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_and_mocking/main.dart';


// https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd

void main() {
  testWidgets('find for TextWiget and Floating Action button Behavior',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    Finder fabutton = find.byType(FloatingActionButton);
    await tester.tap(fabutton);
    await tester.pump();

    expect(fabutton, findsOne);
    expect(find.byType(Text), findsAtLeast(2));
    expect(find.byType(MaterialBanner), findsOne);
  });
}
