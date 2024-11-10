import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { Laundry, Duvet, Carpet }

enum Handled { Peter, Tee, Ranjoz, Mike, Other }

class Expense {
  Expense({
    required this.Name,
    required this.Address,
    required this.Amount,
    required this.Date,
    required this.category,
    // required this.DateOut,
    // required this.delivery,
    // required this.wash
  }) : id = uuid.v4();

  //4 properties that describe a single Expense
  final String Name;
  final String Address;
  final int Amount;
  final String id;
  final DateTime Date;
  final Category category;
  // final DateTime DateOut;
  // final Handled delivery;
  // final Handled wash;

  String get formattedDate {
    return formatter.format(Date);
  }
}
