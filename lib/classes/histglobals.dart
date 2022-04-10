
import 'package:history_logging_app/classes/record.dart';
import 'package:history_logging_app/classes/type.dart';

List<Record> records = [];

void recordsAdd(type, user) {
  records.add(Record(type, user, DateTime.now()));
}

void recordsClear() {
  records.clear();
}

List<Type> types = [];

void typesAdd(author, List<String> lines) {
  types.add(Type(author, DateTime.now(), lines));
}

void typesRemove(removedType) {
  types.removeWhere((type) => type == removedType);
}