import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_unit5_exercise/shelf/models.dart';

void main() {
  test('Book.fromJson keeps only the ID part of the key', () {
    final book = Book.fromJson({
      'key': '/works/OL27482W',
      'title': 'The Hobbit',
      'author_name': ['J.R.R. Tolkien'],
      'first_publish_year': 1937,
      'cover_i': 14627509,
    });
    expect(book.workId, 'OL27482W');
    expect(book.authors.first, 'J.R.R. Tolkien');
  });

  test('Book.fromJson handles a missing author and cover', () {
    final book = Book.fromJson({'key': '/works/OL1W', 'title': 'No Extras'});
    expect(book.authors, isEmpty);
    expect(book.coverId, isNull);
  });

  test('Pick.fromJson reads the Contentful fields', () {
    final pick = Pick.fromJson({
      'fields': {
        'title': 'Interstellar',
        'kind': 'movie',
        'externalId': 'tt0816692',
        'note': 'Great.',
      },
    });
    expect(pick.kind, 'movie');
    expect(pick.externalId, 'tt0816692');
  });
}
