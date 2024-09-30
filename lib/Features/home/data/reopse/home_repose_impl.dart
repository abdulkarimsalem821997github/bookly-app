import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';

import 'package:clean_arch_bookly_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/home_repo.dart';

class HomeReposeImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}