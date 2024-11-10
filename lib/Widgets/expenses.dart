import 'package:expense_tracker/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/Widgets/expenses_list/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        Name: 'Lizar',
        Amount: 350,
        Date: DateTime.now(),
        category: Categorry.Laundry,
        Address: 'Takimu 58'),
    Expense(
        Name: 'Ranjoz',
        Amount: 350,
        Date: DateTime.now(),
        category: Categorry.Laundry,
        Address: 'Takimu 38'),
  ];

  void _openAddLaundryOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laundry Tracker'),
        actions: [
          IconButton.filled(
              onPressed: () {
                _openAddLaundryOverlay();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        Text('The chart'),
        Expanded(
          child: ExpensesList(_registeredExpenses),
        ),
      ]),
    );
  }
}
