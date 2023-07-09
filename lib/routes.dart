import 'package:book_app/pages/BookInfoView/BookInfoView.dart';
import 'package:book_app/pages/BookPreview/BookPreview.dart';
import 'package:book_app/pages/BookQueryView/BookQueryView.dart';
import 'package:book_app/pages/TabsView.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static const String tabsViewRoute = '/tabsView';
  static const String bookQueryViewRoute = '/bookQueryView';
  static const String bookInfoViewRoute = '/bookInfoView';
  static const String bookPreviewRoute = '/bookPreview';
  static String get initialRoute => tabsViewRoute;

  static Map<String, Widget Function(BuildContext)> routes = {
    tabsViewRoute: (context) => const TabsView(),
    bookQueryViewRoute: (context) => const BookQueryView(),
    bookInfoViewRoute: (context) => const BookInfoView(),
    bookPreviewRoute: (context) => const BookPreview(),
  };
}
