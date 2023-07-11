import 'package:book_app/helpers/helpers.dart';
import 'package:book_app/pages/ShopView/controllers/ShopViewController.dart';
import 'package:book_app/pages/components/BookListView.dart';
import 'package:book_app/pages/components/ShimmerListView.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  ShopViewController viewController = ShopViewController();

  /// Function to view all books of current category
  void viewAllCurrentCategoryBooks(BookCategory category) async {
    await Navigator.pushNamed(
      context,
      CustomRoutes.bookQueryViewRoute,
      arguments: {
        "query": category.name,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    viewController.fetchAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                "Book Store",
                style: context.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 6),
            CustomListTile(
                title: "Top Selling", category: BookCategory.TopSelling),
            viewController.topSelling.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.topSelling.value!,
                  ),
            const SizedBox(height: 10),
            CustomListTile(
                title: "Discounted Books",
                category: BookCategory.DiscountedBooks),
            viewController.discountBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.discountBooks.value!,
                  ),
            const SizedBox(height: 10),
            CustomListTile(title: "Sale", category: BookCategory.Sale),
            viewController.saleBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.saleBooks.value!,
                  ),
          ],
        ),
      ),
    );
  }

  /// Custom List Tile
  /// Used to display the category title and view all button
  Widget CustomListTile({
    required String title,
    required BookCategory category,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      onTap: () => viewAllCurrentCategoryBooks(category),
      title: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: Colors.blue,
      ),
    );
  }
}
