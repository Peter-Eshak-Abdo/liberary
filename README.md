# liberary

A عملي of Mobile computer Subject

## Team member:
1- Ahmad Algohary
2- Maher Rommany
3- John Khalil
4- Arsany Gorge
5- Peter Emade
6- Peter Eshak

## ده شرح مبسط لعمل المشروع

Hive: بنسجّل BookAdapter وبنفتح box اسمه booksBox. كل ما نضيف كتاب بنعمل box.add(book) — Hive يخزن الكتاب محلياً على الجهاز. بعد كده لما نفتح التطبيق تاني نقرأ كل القيم من الـ box ونعرضها.

Provider: BookProvider يحتوي على قائمة _books ويعرّضها عبر getter books. لما نعمل add/update/delete بنحدّث الـ box أول، وبعدين نستدعي loadBooksFromBox() يليعمل notifyListeners() عشان الشاشة تتحدث.

CRUD:

Create (Add): في AddBookScreen نجمّع بيانات النموذج وننادي provider.addBook(book).

Read (Get): عند بداية التطبيق BookProvider.loadBooksFromBox() يجلب كل البيانات من Hive ويعرضها في BooksListScreen.

Update: نبحث عن مفتاح العنصر داخل box بالمقارنة book.id وننفذ box.put(key, updatedBook).

Delete: بنفس طريقة الـ update نبحث عن key وننفّذ box.delete(key).

ID: لكل كتاب عند الإنشاء نعطيه DateTime.now().millisecondsSinceEpoch كـ id فريد.