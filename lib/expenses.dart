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
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('the chart'),
          Text('expenses list..'),
        ],
      ),
    );
  }
}
