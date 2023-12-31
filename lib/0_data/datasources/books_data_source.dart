
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_app/0_data/models/book_model.dart';
import '../exceptions/exception.dart';

abstract class BooksRemoteDataSource {
  ///request a list of books from api
  ///returns a List of [BookModel] if successful

  Future<List<BookModel>> fetchBooksListFromApi();
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  BooksRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<List<BookModel>> fetchBooksListFromApi() async{
    List<BookModel> books = [];
    final response = await client.get(
      Uri.parse('https://hapi-books.p.rapidapi.com/nominees/romance/2020'),
      headers: {
        'X-RapidAPI-Key': 'PASS IN YOUR API KEY HERE',
        'X-RapidAPI-Host': 'PASS IN YOUR HOST URL HERE'
      }
    );
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);

      //debugPrint('RESPONSE-BODY: $jsonData');
      for(var book in jsonData){
        books.add(BookModel.fromJson(book));
      }
    /*  books.forEach((element) {
        print('${element.bookId} | ${element.bookTitle} | ${element.bookAuthor}\n');
      });*/
      return books;
    }else{
      throw ServerException();
    }
  }

}
