
import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {

  const BookEntity({
    required this.bookId,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookCoverImage,
  });

  final int bookId;
  final String bookTitle;
  final String bookAuthor;
  final String bookCoverImage;

  @override
  List<Object?> get props => [bookId, bookTitle, bookAuthor, bookCoverImage];
}