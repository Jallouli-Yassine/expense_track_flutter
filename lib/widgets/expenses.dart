import 'dart:ffi';

import 'package:expense_tracker/widgets/chart/chart.dart';
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

  void _removeExpense(Expense e) {
    final expenseIndex = _ListOfExpenses.indexOf(e);
    setState(() {
      _ListOfExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text(
          'expense deleted!',
        ),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _ListOfExpenses.insert(expenseIndex, e);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainView = const Center(
      child: Text('no data found'),
    );
    if (_ListOfExpenses.isNotEmpty) {
      mainView = Expanded(
        child: ExpenseList(
          expensesList: _ListOfExpenses,
          onDelete: _removeExpense,
        ),
      );
    }

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
          Chart(expenses: _ListOfExpenses),
          //bch tetra elisa lezem nhotouha f wost expanded
          mainView,
        ],
      ),
    );
  }
}
