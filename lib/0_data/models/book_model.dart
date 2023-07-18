import 'package:book_app/1_domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

class BookModel extends BookEntity with EquatableMixin{
  BookModel({
    required int bookId,
    required String bookTitle,
    required String bookAuthor,
    required String bookCoverImage
  }) : super(bookId: bookId, bookTitle: bookTitle, bookAuthor: bookAuthor, bookCoverImage:  bookCoverImage);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      bookId: json["book_id"],
      bookTitle: json["name"],
      bookAuthor: json["author"],
      bookCoverImage: json["cover"],
  );

}
