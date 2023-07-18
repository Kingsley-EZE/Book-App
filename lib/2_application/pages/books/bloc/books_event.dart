part of 'books_bloc.dart';

abstract class BooksEvent {
  const BooksEvent();
}

class BooksRequestedEvent extends BooksEvent {}
