
import 'package:book_app/0_data/datasources/books_data_source.dart';
import 'package:book_app/1_domain/entities/book_entity.dart';
import 'package:book_app/1_domain/failures/failures.dart';
import 'package:book_app/1_domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import '../exceptions/exception.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl({required this.booksRemoteDataSource});
  final BooksRemoteDataSource booksRemoteDataSource;

  @override
  Future<Either<Failures, List<BookEntity>>> fetchListOfBooks() async{
    try{
      final result = await booksRemoteDataSource.fetchBooksListFromApi();
      return right(result);
    } on ServerException catch(_){
      return left(ServerFailure());
    }catch(e){
      return left(GeneralFailure());
    }
  }

}