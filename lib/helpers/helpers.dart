import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Adding a helper function to check if ScrollController has reached bottom
/// If its reached then perform any function
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

/// Num for all book categories in app
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

/// Adding a helper function to get name of book category
/// Which is used as a query to fetch books from api
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

/// Data class to store category data
class BookCategoryData {
  final String title;
  final String image;
  final BookCategory category;

  BookCategoryData({
    required this.title,
    required this.image,
    required this.category,
  });
}
