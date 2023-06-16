import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expensesList});
  final List<Expense> expensesList;
  @override
  Widget build(BuildContext context) {
    //ken list fiha barchaa hajet manestamluch column donc nestamlo ListView
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expensesList[index]),
    ); // builder tecreatii l items only ki bch yetraw
  }
}
