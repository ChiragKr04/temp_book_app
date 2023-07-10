import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension BottomReachExtension on ScrollController {
  void onBottomReach(
    VoidCallback callback, {
    double sensitivity = 300.0,
  }) {
    addListener(() {
      final bool isReverse =
          position.userScrollDirection == ScrollDirection.reverse;

      final bool reachedSensitivePixels = position.extentAfter < sensitivity;
      if (isReverse && reachedSensitivePixels) {
        callback();
      }
    });
  }
}

enum BookCategory {
  TopSelling,
  NewReleases,
  Comedy,
  Comics,
  Adventure,
  SciFi,
  NonFiction,
  Inspiring,
  DiscountedBooks,
  Sale,
}

extension BookCategoryExtension on BookCategory {
  String get name {
    switch (this) {
      case BookCategory.TopSelling:
        return 'Top Selling';
      case BookCategory.NewReleases:
        return 'New Releases';
      case BookCategory.Comedy:
        return 'Comedy';
      case BookCategory.Comics:
        return 'Comics';
      case BookCategory.Adventure:
        return 'Adventure';
      case BookCategory.SciFi:
        return 'Sci-Fi';
      case BookCategory.NonFiction:
        return 'Non-fiction';
      case BookCategory.Inspiring:
        return 'Inspiring';
      case BookCategory.DiscountedBooks:
        return 'Discount Books';
      case BookCategory.Sale:
        return 'Sale';
      default:
        return '';
    }
  }
}
