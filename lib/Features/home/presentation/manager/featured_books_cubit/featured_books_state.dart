part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoeading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoeading extends FeaturedBooksState {}

class FeaturedBooksPaginationFeature extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFeature(this.errorMessage);
}
  
class FeaturedBooksError extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksError(this.errorMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
