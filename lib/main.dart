import 'package:book_app/2_application/pages/books/book_dashboard.dart';
import 'package:book_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '2_application/core/services/theme_service.dart';
import 'injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
      ChangeNotifierProvider(
          create: (context) => ThemeService(),
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child){
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const BookListWrapper(),
      );
    });
  }
}
