import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: [
            Text(expense.Name),
            const SizedBox(
              width: 50,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Category'),
                    const SizedBox(
                      width: 50,
                    ),
                    Text('\$${expense.Amount.toString()}'),
                  ],
                ),
                Row(
                  children: [
                    Text(expense.Address),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(expense.formattedDate),
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
