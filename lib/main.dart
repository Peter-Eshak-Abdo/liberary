import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/book_model.dart';
import 'providers/book_provider.dart';
import 'screens/books_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Hive
  await Hive.initFlutter();

  // register adapter
  Hive.registerAdapter(BookAdapter());

  // open box
  await Hive.openBox<Book>('booksBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide the BookProvider app-wide
    return ChangeNotifierProvider(
      create: (_) => BookProvider()..loadBooksFromBox(),
      child: MaterialApp(
        title: 'Books Hive Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BooksListScreen(),
      ),
    );
  }
}
