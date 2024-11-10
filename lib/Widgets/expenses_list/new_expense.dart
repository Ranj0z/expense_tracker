import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/enums.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Categorry _selectedCategory = Categorry.Laundry;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime.now();

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitLaundryItem() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;
    if (amountIsInvalid ||
        _nameController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty ||
        _selectedDate == null) {
      // Show error message.
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please ensure you have entered the Name, Address, Amount and date correctly'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  maxLength: 20,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Selected Date'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    icon: Icon(Icons.home),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    prefixText: '\Ksh ',
                    labelText: 'Amount',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Categorry.values
                      .map(
                        (Categorry) => DropdownMenuItem(
                          value: Categorry,
                          child: Text(
                            Categorry.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (values) {
                    if (values == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = values;
                    });
                  }),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              Spacer(),
              OutlinedButton(
                onPressed: _submitLaundryItem,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
