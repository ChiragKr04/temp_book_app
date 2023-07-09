import 'package:book_app/pages/BookQueryView/controller/BookQueryViewController.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookQueryView extends StatefulWidget {
  const BookQueryView({super.key});

  @override
  State<BookQueryView> createState() => _BookQueryViewState();
}

class _BookQueryViewState extends State<BookQueryView> {
  late String query;
  final BookQueryViewController viewController = BookQueryViewController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    query = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)["query"] as String;
    viewController.init(query: query);
  }

  @override
  void dispose() {
    super.dispose();
    viewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(query),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                controller: viewController.scrollController,
                children: [
                  ...viewController.books.map(
                    (book) => InkWell(
                      onTap: () async {
                        Navigator.of(context).pushNamed(
                          CustomRoutes.bookInfoViewRoute,
                          arguments: {
                            "bookId": book.id,
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: book.volumeInfo.imageLinks != null
                                        ? NetworkImage(
                                            book.volumeInfo.imageLinks!
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          book.volumeInfo.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodyLarge!
                                              .copyWith(
                                            fontSize: 21,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Flexible(
                                        child: Text(
                                          book.volumeInfo.subtitle ?? "",
                                          maxLines: 3,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (viewController.isSearching)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (viewController.hasReachedEnd)
              const Center(
                child: Text("Thank you for scrolling!"),
              ),
          ],
        ),
      );
    });
  }
}
