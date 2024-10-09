import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/custom_book_loading_indicator.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_fading_widget.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImageLoadingIndicator(),
              );
            }),
      ),
    );
  }
}