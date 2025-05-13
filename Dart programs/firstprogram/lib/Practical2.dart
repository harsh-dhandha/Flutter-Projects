import 'dart:io';
import 'dart:async';

abstract class User {
  String displayUserType();
}

// Member class
class Member extends User {
  final String name;

  Member(this.name);

  @override
  String displayUserType() => "Regular Library Member: $name";
}

class Book {
  String title;
  String author;
  int yearPublished;
  bool isAvailable;

  Book(this.title, this.author, this.yearPublished, [this.isAvailable = true]);

  String get getTitle => title;
  String get getAuthor => author;
  int get getYear => yearPublished;
  bool get availability => isAvailable;

  set setAvailability(bool value) => isAvailable = value;

  String displayDetails() {
    return '''
    Title: $title
    Author: $author
    Year: $yearPublished
    Available: ${isAvailable ? 'Yes' : 'No'}
    ''';
  }
}

class EBook extends Book {
  double fileSize;

  EBook(String title, String author, int yearPublished, this.fileSize)
      : super(title, author, yearPublished);

  @override
  String displayDetails() {
    return '''
    Title: $title
    Author: $author
    Year: $yearPublished
    Available: ${isAvailable ? 'Yes' : 'No'}
    File Size: ${fileSize}MB
    ''';
  }
}

class Library {
  List<Book> books = [];
  static int totalBooks = 0;

  Library() {
    // sample books
    addBook(Book("The Great Gatsby", "F. Scott Fitzgerald", 1925));
    addBook(Book("To Kill a Mockingbird", "Harper Lee", 1960));
    addBook(EBook("Digital Revolution", "John Smith", 2020, 5.2));
  }

  void addBook(Book book) {
    books.add(book);
    totalBooks++;
  }

  void borrowBook(String title) {
    try {
      Book book = books.firstWhere(
        (b) => b.title.toLowerCase() == title.toLowerCase(),
        orElse: () => throw Exception("Book not found"),
      );

      if (!book.isAvailable) {
        throw Exception("Book is already borrowed");
      }

      book.setAvailability = false;
      print("Successfully borrowed: ${book.title}");
    } catch (e) {
      print("Error: $e");
    }
  }

  void returnBook(String title) {
    try {
      Book book = books.firstWhere(
        (b) => b.title.toLowerCase() == title.toLowerCase(),
        orElse: () => throw Exception("Book not found"),
      );

      if (book.isAvailable) {
        throw Exception("Book was not borrowed");
      }

      book.setAvailability = true;
      print("Successfully returned: ${book.title}");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<Book>> listBooksAsync() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    return books;
  }

  static int getTotalBooks() => totalBooks;
}

void main() async {
  Library library = Library();
  Member member = Member("John Doe");

  while (true) {
    print("\n--- Library Management System ---");
    print("Current User: ${member.displayUserType()}");
    print("1. Add a new book");
    print("2. Borrow a book");
    print("3. Return a book");
    print("4. List all books");
    print("5. Exit");
    print("Total books in library: ${Library.getTotalBooks()}");

    stdout.write("\nEnter your choice (1-5): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Enter title: ");
        String title = stdin.readLineSync() ?? "";
        stdout.write("Enter author: ");
        String author = stdin.readLineSync() ?? "";
        stdout.write("Enter year: ");
        int year = int.parse(stdin.readLineSync() ?? "0");
        stdout.write("Is this an ebook? (y/n): ");
        String isEbook = stdin.readLineSync()?.toLowerCase() ?? "n";

        if (isEbook == "y") {
          stdout.write("Enter file size (MB): ");
          double fileSize = double.parse(stdin.readLineSync() ?? "0");
          library.addBook(EBook(title, author, year, fileSize));
        } else {
          library.addBook(Book(title, author, year));
        }
        print("Book added successfully!");
        break;

      case "2":
        stdout.write("Enter book title to borrow: ");
        String title = stdin.readLineSync() ?? "";
        library.borrowBook(title);
        break;

      case "3":
        stdout.write("Enter book title to return: ");
        String title = stdin.readLineSync() ?? "";
        library.returnBook(title);
        break;

      case "4":
        print("\nFetching book list...");
        List<Book> books = await library.listBooksAsync();
        print("\nLibrary Catalog:");
        for (var book in books) {
          print(book.displayDetails());
        }
        break;

      case "5":
        print("Thank you for using the Library Management System!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
