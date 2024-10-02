import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoeading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksError(failure.message)),
      (books) => emit(NewestBooksSuccess(books)));
  }
  
}
