import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/core/widget/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: '19.99 &',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri uri = Uri.parse(bookModel.volumeInfo!.previewLink!);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              fontSize: 16,
              text: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo!.previewLink == null){
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
