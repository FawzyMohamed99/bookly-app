import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel}) : super(key: key);
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children:
      [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(imgUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? '',),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRating(
          rating: bookModel.volumeInfo!.averageRating ?? 0,
          count: bookModel.volumeInfo!.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}