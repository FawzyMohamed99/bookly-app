import 'package:bookly_app/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                      imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail ?? '',),
                  );
                }),
          );
        }
        else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
