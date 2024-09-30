import 'package:hive/hive.dart';
import '../../../Features/home/domain/entities/book_entity.dart';

Future<void> saveBooksData(List<BookEntity> books, String boxName) async {
  var box = await Hive.openBox(boxName);
  box.addAll(books);
}
