import 'package:intl/intl.dart';

bool hasLegalAge(String born) {
  DateFormat format = DateFormat('dd-MM-yyyy');
  DateTime actualDate = DateTime.now();
  DateTime dateBorn = format.parse(born);

  Duration age = actualDate.difference(dateBorn);
  int ageInYears = age.inDays ~/ 365;

  return ageInYears > 18;
}
