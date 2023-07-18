
import 'package:book_app/1_domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/book_entity.dart';
import '../failures/failures.dart';

class BooksUseCases {

  BooksUseCases({required this.bookRepository});
  final BookRepository bookRepository;

  Future<Either<Failures, List<BookEntity>>> fetchBookList() async{
    return await bookRepository.fetchListOfBooks();
  }

}