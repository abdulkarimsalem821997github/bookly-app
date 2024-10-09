import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoeading());
    } else {
      emit(FeaturedBooksPaginationLoeading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
        (failure) => pageNumber == 0
            ? emit(FeaturedBooksError(failure.message))
            : emit(FeaturedBooksPaginationFeature(failure.message)),
        (books) => emit(FeaturedBooksSuccess(books)));
  }
}
