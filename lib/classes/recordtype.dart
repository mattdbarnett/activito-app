import 'package:intl/intl.dart';

class RecordType {
  String title;
  String author;
  String description;
  DateTime creationDateTime;
  List<String> lines;

  String getTitle() {
    return title;
  }

  String getAuthor() {
    return author;
  }

  String getCreationDT() {
    return DateFormat('kk:mm (yyyy-MM-dd)').format(creationDateTime);
  }

  String getDesc() {
    return description;
  }

  String getFormat() {
    return lines.toString();
  }

  RecordType(this.title, this.author, this.description, this.creationDateTime, this.lines);
}
