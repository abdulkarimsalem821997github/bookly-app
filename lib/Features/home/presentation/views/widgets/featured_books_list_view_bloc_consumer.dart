import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListViewBlocConsumer extends StatelessWidget {
  List<BookEntity> books = [];
  FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (BuildContext context, FeaturedBooksState state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationFeature) {
        ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar(state.errorMessage));
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoeading ||
          state is FeaturedBooksPaginationFeature) {
        return FeaturedBooksListView(books: books);
      } else if (state is FeaturedBooksError) {
        return Text(state.errorMessage);
      } else {
        return const Center(child: FeaturedBooksListViewLoadingIndicator());
      }
    });
  }
}
