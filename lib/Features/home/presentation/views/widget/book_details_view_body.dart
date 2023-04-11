import 'package:bookly_app/Features/home/presentation/views/widget/books_details_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return CustomScrollView(
      slivers:
      [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                 CustomBookDetailsAppBar(),
                 BookDetailsSection(),

                 Expanded(
                  child:  SizedBox(
                    height: 50,
                  ),
                ),
                  SimilarBooksSection(),
                 SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
   
  }
}





