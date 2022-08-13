import 'package:hive/hive.dart';
part 'database.g.dart';

@HiveType(typeId: 1)
class DBStudentList {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String batch;
  @HiveField(2)
  final String domain;
  @HiveField(3)
  final String mobilenumber;
  @HiveField(4)
  final String? image;

  DBStudentList(
      {required this.name,
      required this.batch,
      required this.domain,
      required this.mobilenumber,
      required this.image});
}
