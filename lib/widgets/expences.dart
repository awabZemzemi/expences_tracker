import 'package:expences_tracker/widgets/expences%20list/expences_list.dart';
import 'package:expences_tracker/widgets/new_expence.dart';
import 'package:flutter/material.dart';
import 'package:expences_tracker/models/expence.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});
  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  final List<Expence> _registeredExpenses = [
    Expence(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expence(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpence(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expences Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [
        const Text(
          "chart",
        ),
        Expanded(
          child: ExpencesList(
            expencesList: _registeredExpenses,
          ),
        )
      ]),
    );
  }
}
