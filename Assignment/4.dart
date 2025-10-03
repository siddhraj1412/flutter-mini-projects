abstract class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayInfo();
}

class EBook extends Book {
  double fileSizeMB;
  String fileFormat;

  EBook(String title, String author, this.fileSizeMB, this.fileFormat)
    : super(title, author);

  @override
  void displayInfo() {
    print(
      'EBook: "$title" by $author, Format: $fileFormat, Size: $fileSizeMB MB',
    );
  }
}

class PrintedBook extends Book {
  int pageCount;
  PrintedBook(String title, String author, this.pageCount)
    : super(title, author);
  @override
  void displayInfo() {
    print('Printed Book: "$title" by $author, Pages: $pageCount');
  }
}

void main() {
  Book ebook = EBook('Flutter for Beginners', 'Om', 5.5, 'PDF');
  Book printedBook = PrintedBook('Mastering Dart', 'Hari', 450);

  ebook.displayInfo();
  printedBook.displayInfo();
}
