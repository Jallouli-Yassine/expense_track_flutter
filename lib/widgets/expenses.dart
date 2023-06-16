import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _ListOfExpenses = [
    Expense(
      title: "mekla",
      amount: 45.5,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "cinema",
      amount: 15.8,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "buy course",
      amount: 9.99,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense e) {
    setState(() {
      _ListOfExpenses.add(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpense,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //Toolbar with the add btn => Row()

          const Text('the chart'),
          //bch tetra elisa lezem nhotouha f wost expanded
          Expanded(child: ExpenseList(expensesList: _ListOfExpenses)),
        ],
      ),
    );
  }
}
