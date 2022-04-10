
import 'package:history_logging_app/classes/record.dart';
import 'package:history_logging_app/classes/recordtype.dart';

List<Record> records = [];

void recordsAdd(type, user) {
  records.add(Record(type, user, DateTime.now()));
}

void recordsClear() {
  records.clear();
}

List<RecordType> types = [];

void typesAdd(title, author, description, List<String> lines) {
  types.add(RecordType(title, author, description, DateTime.now(), lines));
}

void typesRemove(removedType) {
  types.removeWhere((type) => type == removedType);
}