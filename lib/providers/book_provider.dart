import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/book_model.dart';

class BookProvider extends ChangeNotifier {
  final Box<Book> _box = Hive.box<Book>('booksBox');

  List<Book> _books = [];
  List<Book> get books => _books;

  // Load from Hive when app starts
  void loadBooksFromBox() {
    _books = _box.values.toList();
    notifyListeners();
  }

  // Get (already provided by getter) but helper to refresh
  void refresh() {
    _books = _box.values.toList();
    notifyListeners();
  }

  // Add
  Future<void> addBook(Book book) async {
    // key will be auto index, but we save Book as value containing its id
    await _box.add(book);
    loadBooksFromBox();
  }

  // Update: find Hive index of the old book and replace it
  Future<void> updateBook(Book updatedBook) async {
    // find the key (index) of book with matching id
    final key = _box.keys.firstWhere(
          (k) {
        final b = _box.get(k) as Book;
        return b.id == updatedBook.id;
      },
      orElse: () => null,
    );

    if (key != null) {
      await _box.put(key, updatedBook);
      loadBooksFromBox();
    }
  }

  // Delete
  Future<void> deleteBook(int bookId) async {
    final key = _box.keys.firstWhere(
          (k) {
        final b = _box.get(k) as Book;
        return b.id == bookId;
      },
      orElse: () => null,
    );

    if (key != null) {
      await _box.delete(key);
      loadBooksFromBox();
    }
  }

}