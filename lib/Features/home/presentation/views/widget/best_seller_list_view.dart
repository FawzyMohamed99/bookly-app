import 'package:bookly_app/Features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
          itemBuilder: (context,index){
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  BestSellerListViewItem());
      }
      ),
    );
  }
}
