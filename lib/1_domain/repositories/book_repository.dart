import 'package:book_app/1_domain/entities/book_entity.dart';
import 'package:book_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {

  Future<Either<Failures, List<BookEntity>>> fetchListOfBooks();

}