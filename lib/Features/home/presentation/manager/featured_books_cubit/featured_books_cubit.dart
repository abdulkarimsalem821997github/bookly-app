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

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoeading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) => emit(FeaturedBooksError(failure.message)),
      (books) => emit(FeaturedBooksSuccess(books)));
  }
}
