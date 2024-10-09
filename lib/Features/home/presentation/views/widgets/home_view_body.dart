import 'package:clean_arch_bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';

import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_consumer.dart';
import 'featured_books_list_view.dart';
import 'best_seller_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListViewBlocConsumer(),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
