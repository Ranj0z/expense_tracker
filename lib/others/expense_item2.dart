import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem2 extends StatelessWidget {
  const ExpenseItem2(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(expense.Name),
                    Text(expense.Address),
                  ],
                ),
                Row(
                  children: [
                    Text(expense.formattedDate),
                    SizedBox(width: 40,),
                    Row(
                      children: [
                        const Text('Category'),
                        const SizedBox(
                          width: 150,
                        ),
                        Text('\$${expense.Amount.toString()}'),
                      ],
                    ),
                  ],
                ),
              ],
        ),
      ),
    );
  }
}
