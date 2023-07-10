import 'package:book_app/helpers/helpers.dart';
import 'package:book_app/pages/components/BookListView.dart';
import 'package:book_app/pages/components/ShimmerListView.dart';
import 'package:book_app/pages/HomeView/controllers/HomeViewController.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewController viewController = HomeViewController();

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
            Text(
              "Explore Books",
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 80,
              child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: viewController.getBookCategoryData().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => viewAllCurrentCategoryBooks(
                      viewController.getBookCategoryData()[index].category,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            viewController.getBookCategoryData()[index].image,
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            viewController.getBookCategoryData()[index].title,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            CustomListTile(
                title: "Adventure", category: BookCategory.Adventure),
            viewController.adventureBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.adventureBooks.value!,
                  ),
            const SizedBox(height: 10),
            CustomListTile(title: "Sci-Fi", category: BookCategory.SciFi),
            viewController.scifiBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.scifiBooks.value!,
                  ),
            const SizedBox(height: 10),
            CustomListTile(
                title: "Non-Fiction", category: BookCategory.NonFiction),
            viewController.nonfictionBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.nonfictionBooks.value!,
                  ),
            const SizedBox(height: 10),
            CustomListTile(
                title: "Inspiring", category: BookCategory.Inspiring),
            viewController.inspiringBooks.value == null
                ? const ShimmerListView()
                : BookListView(
                    bookList: viewController.inspiringBooks.value!,
                  ),
          ],
        ),
      ),
    );
  }

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
