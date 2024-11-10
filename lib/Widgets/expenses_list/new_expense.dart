import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle ='';
  void _saveTitleInput (String inputValue){
    _enteredTitle = inputValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              TextField(
                // onChanged: ,
                maxLength: 20,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          Row(children: [
            TextField(decoration: InputDecoration(labelText: 'Address'),),
            Spacer(),
            TextField(decoration: InputDecoration(icon: Icon(Icons.money), labelText: 'Amount'),)
          ],),
          Row(children: [ElevatedButton(onPressed: (){}, child: Text('Name'))],)

        ],
      ),
    );
  }
}
