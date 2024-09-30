import 'package:clean_arch_bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';

import 'package:clean_arch_bookly_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/home_repo.dart';

class HomeReposeImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeReposeImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
