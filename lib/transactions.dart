import 'package:flutter/foundation.dart';
class Transactions{
 final int id;
  final String title;
  final double amount;
final DateTime date;
  Transactions({
   required this.id,
   required this.title,
   required this.amount,
   required this.date
  });
}