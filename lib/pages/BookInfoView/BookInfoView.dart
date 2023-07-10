import 'package:book_app/pages/BookInfoView/controller/BookInfoViewController.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class BookInfoView extends StatefulWidget {
  const BookInfoView({super.key});

  @override
  State<BookInfoView> createState() => _BookInfoViewState();
}

class _BookInfoViewState extends State<BookInfoView> {
  BookInfoViewController viewController = BookInfoViewController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String bookId = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)["bookId"] as String;
    viewController.init(bookId: bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: viewController.isLoading.value
            ? null
            : AppBar(
                title: Text(viewController.bookData.value!.volumeInfo.title),
              ),
        body: (viewController.isLoading.value)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: viewController.bookData.value!
                                              .volumeInfo.imageLinks !=
                                          null
                                      ? NetworkImage(
                                          viewController
                                              .bookData
                                              .value!
                                              .volumeInfo
                                              .imageLinks!
                                              .smallThumbnail,
                                        )
                                      : const AssetImage(
                                              "assets/images/flutter_logo.png")
                                          as ImageProvider,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        viewController
                                            .bookData.value!.volumeInfo.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: context.textTheme.bodyLarge!
                                            .copyWith(
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ...viewController
                                        .bookData.value!.volumeInfo.authors
                                        .map(
                                      (author) => Flexible(
                                        child: Text(
                                          author,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                    if (viewController.bookData.value!
                                            .volumeInfo.publisher !=
                                        null)
                                      Flexible(
                                        child: Text(
                                          viewController.bookData.value!
                                                  .volumeInfo.publisher ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodyMedium,
                                        ),
                                      ),
                                    Flexible(
                                      child: Text(
                                        "Released ${viewController.bookData.value!.volumeInfo.publishedDate}",
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star),
                                    Text(
                                      viewController.bookData.value!.volumeInfo
                                                  .averageRating ==
                                              null
                                          ? "0.0"
                                          : viewController.bookData.value!
                                              .volumeInfo.averageRating
                                              .toString(),
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${viewController.bookData.value!.volumeInfo.ratingsCount ?? "No"} reviews",
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          VerticaleLine(),
                          Column(
                            children: [
                              Icon(
                                viewController.bookData.value!.saleInfo
                                                .isEbook !=
                                            null &&
                                        viewController
                                            .bookData.value!.saleInfo.isEbook!
                                    ? Icons.book_outlined
                                    : Icons.menu_book_outlined,
                              ),
                              Text(
                                viewController.bookData.value!.saleInfo
                                                .isEbook !=
                                            null &&
                                        viewController
                                            .bookData.value!.saleInfo.isEbook!
                                    ? "Ebook"
                                    : "Paperback",
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          VerticaleLine(),
                          Column(
                            children: [
                              Text(
                                "${viewController.bookData.value!.volumeInfo.pageCount}",
                                style: context.textTheme.bodyMedium!.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Pages",
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.blue,
                                side: const BorderSide(color: Colors.blue),
                              ),
                              onPressed: () {
                                if (kIsWeb) {
                                  html.window.open(
                                    viewController
                                        .bookData.value!.volumeInfo.previewLink
                                        .toString()
                                        .replaceAll("http", "https"),
                                    '_blank',
                                  );
                                  return;
                                }
                                Navigator.of(context).pushNamed(
                                  CustomRoutes.bookPreviewRoute,
                                  arguments: {
                                    "url": viewController
                                        .bookData.value!.volumeInfo.previewLink
                                        .toString()
                                        .replaceAll("http", "https"),
                                  },
                                );
                              },
                              child: const Text(
                                "Free Sample",
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              onPressed: () {
                                if (kIsWeb) {
                                  html.window.open(
                                    viewController
                                        .bookData.value!.volumeInfo.infoLink
                                        .toString(),
                                    '_blank',
                                  );
                                  return;
                                }
                                Navigator.of(context).pushNamed(
                                  CustomRoutes.bookPreviewRoute,
                                  arguments: {
                                    "url": viewController
                                        .bookData.value!.volumeInfo.infoLink
                                        .toString(),
                                  },
                                );
                              },
                              child: Text(
                                viewController.bookData.value!.saleInfo
                                            .listPrice ==
                                        null
                                    ? "Free"
                                    : "Buy ₹${viewController.bookData.value!.saleInfo.listPrice!.amount}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "About this book",
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        viewController.bookData.value!.volumeInfo.subtitle
                                ?.replaceAll(RegExp(r"<[^>]*>"), "") ??
                            "",
                        style: context.textTheme.bodyMedium,
                      ),
                      Text(
                        viewController.bookData.value!.volumeInfo.description
                                ?.replaceAll(RegExp(r"<[^>]*>"), "") ??
                            "",
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget VerticaleLine() {
    return Container(
      height: 30,
      width: 2,
      color: Colors.black,
    );
  }
}
