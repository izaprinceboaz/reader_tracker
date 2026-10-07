import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utils/books_details_arguments.dart';

class BooksDetailsScreen extends StatefulWidget {
  const BooksDetailsScreen({super.key});

  @override
  State<BooksDetailsScreen> createState() => _BooksDetailsScreenState();
}

class _BooksDetailsScreenState extends State<BooksDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as BooksDetailsArguments;
    final Book book = args.itemBook;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (book.imageLinks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.network(
                  book.imageLinks['thumbnail'] ?? '',
                ),
              ),
            Text(
              book.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              book.authors.join(', & '),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Published: ${book.publishedDate}',
            ),
            Text(
              'Page Count: ${book.pageCount}',
            ),
            Text(
              'Language: ${book.language}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Save')),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon:Icon(Icons.favorite_border),
                  label: Text('Favorite'),
                ),
              ],
            ),
             SizedBox(height: 5),
             Text(
                'Description',
                style: Theme.of(context).textTheme.headlineMedium,
             ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                     .withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),

              ),
              child: Text(
                book.description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
