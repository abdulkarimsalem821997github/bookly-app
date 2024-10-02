part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoeading extends NewestBooksState {}
  
class NewestBooksError extends NewestBooksState {
  final String errorMessage;

  NewestBooksError(this.errorMessage);
}
class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
