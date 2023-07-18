import 'package:book_app/2_application/pages/books/bloc/books_bloc.dart';
import 'package:book_app/2_application/pages/books/widgets/book_grid_item.dart';
import 'package:book_app/2_application/pages/books/widgets/error_message.dart';
import 'package:book_app/2_application/pages/books/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/injection.dart';
import '../../core/services/theme_service.dart';

class BookListWrapper extends StatelessWidget {
  const BookListWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BooksBloc>(),
        child: const BookDashboard(),
    );
  }
}


class BookDashboard extends StatefulWidget {
  const BookDashboard({super.key});

  @override
  State<BookDashboard> createState() => _BookDashboardState();
}

class _BookDashboardState extends State<BookDashboard> {

  @override
  void initState() {
    BlocProvider.of<BooksBloc>(context).add(BooksRequestedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book-App',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) =>
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme()),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchBarField(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Popular Books',
                style: themeData.textTheme.headline2,
              ),
            ),

            BlocBuilder<BooksBloc, BooksState>(
                builder: (context, state){
                  if(state is BooksLoadingState){
                    return Center(
                      child: CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      ),
                    );
                  }else if(state is BooksLoadedState){
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: state.bookEntity.length, // Number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        return BookGridItem(
                          imageUrl: state.bookEntity[index].bookCoverImage,
                          bookTitle: state.bookEntity[index].bookTitle,
                          bookAuthor: state.bookEntity[index].bookAuthor,
                          onPress: (){},
                        );
                      },
                    );
                  }else if(state is BooksErrorState){
                    return ErrorMessage(message: state.message);
                  }
                  return Text(
                    'Something went wrong',
                    style: themeData.textTheme.headline1,
                    textAlign: TextAlign.center,
                  );
                }),

          ],
        ),
      ),
    );
  }
}
