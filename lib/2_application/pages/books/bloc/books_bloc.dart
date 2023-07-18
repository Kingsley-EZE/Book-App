import 'dart:async';
import 'package:book_app/1_domain/usecases/books_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/1_domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../1_domain/failures/failures.dart';

part 'books_event.dart';
part 'books_state.dart';

const serverErrorMessage = 'Ooops...you encountered some server error';
const generalErrorMessage = 'Something went wrong';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksUseCases booksUseCases;
  BooksBloc({required this.booksUseCases}) : super(BooksInitialState()) {

    on<BooksRequestedEvent>((event, emit) async {
      emit(BooksLoadingState());
      final failureOrBooks = await booksUseCases.fetchBookList();
      failureOrBooks.fold(
        (failure) => emit(BooksErrorState(message: _mapFailureToMessage(failure))),
        (books) => emit(BooksLoadedState(bookEntity: books)),
      );
    });
  }
  String _mapFailureToMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return serverErrorMessage;
      default:
        return generalErrorMessage;
    }
  }
}
