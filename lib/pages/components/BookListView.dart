import 'package:book_app/models/BookModel.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// BookListView is a widget which is used to show list of books 
/// in horizontal scrollable list view
/// [bookList] is the list of books which will be shown in the list view
class BookListView extends StatelessWidget {
  const BookListView({
    super.key,
    required this.bookList,
  });

  final List<BookItem> bookList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CustomRoutes.bookInfoViewRoute,
                  arguments: {
                    "bookId": bookList[index].id,
                  },
                );
              },
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: SizedBox(
                            width: 150,
                            height: 200,
                            child: bookList[index].volumeInfo.imageLinks == null
                                ? Image.asset("assets/images/new_book.png")
                                : Image.network(
                                    bookList[index]
                                        .volumeInfo
                                        .imageLinks!
                                        .thumbnail,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.green.shade300,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                bookList[index].saleInfo.listPrice == null
                                    ? "Free"
                                    : bookList[index]
                                                .saleInfo
                                                .listPrice!
                                                .discountAmount ==
                                            null
                                        ? "Free"
                                        : "Save ${bookList[index].saleInfo.listPrice!.discountAmount!.toStringAsFixed(0)}%",
                                style: context.textTheme.labelSmall!.copyWith(
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      bookList[index].volumeInfo.title,
                      style: context.textTheme.labelLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      bookList[index].saleInfo.listPrice == null
                          ? "Free"
                          : bookList[index].saleInfo.listPrice!.amount == null
                              ? "Free"
                              : "₹${bookList[index].saleInfo.listPrice!.amount!.toStringAsFixed(2)}",
                      style: context.textTheme.labelLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
