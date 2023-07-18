import 'package:book_app/0_data/datasources/books_data_source.dart';
import 'package:book_app/0_data/repositories/book_repository_impl.dart';
import 'package:book_app/1_domain/repositories/book_repository.dart';
import 'package:book_app/1_domain/usecases/books_usecases.dart';
import 'package:book_app/2_application/pages/books/bloc/books_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.I;

Future<void> init() async{

  sl.registerFactory(() => BooksBloc(booksUseCases: sl()));

  sl.registerFactory(() => BooksUseCases(bookRepository: sl()));

  sl.registerFactory<BookRepository>(() => BookRepositoryImpl(booksRemoteDataSource: sl()));

  sl.registerFactory<BooksRemoteDataSource>(() => BooksRemoteDataSourceImpl(client: sl()));

  sl.registerFactory(() => http.Client());

}