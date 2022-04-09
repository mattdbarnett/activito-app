
import 'package:history_logging_app/classes/record.dart';

List<Record> records = [];

void addRecord(type, user) {
  records.add(Record(type, user, DateTime.now()));
}