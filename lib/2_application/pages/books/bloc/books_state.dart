part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState();
  @override
  List<Object> get props => [];
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksLoadedState extends BooksState {

  const BooksLoadedState({required this.bookEntity});
  final List<BookEntity> bookEntity;

  @override
  List<Object> get props => [bookEntity];
}

class BooksErrorState extends BooksState {
  const BooksErrorState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
