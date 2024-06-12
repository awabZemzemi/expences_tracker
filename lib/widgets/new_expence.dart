import 'package:flutter/material.dart';
import 'package:expences_tracker/models/expence.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});
  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }
}

/*String titleInput = '';
void _onChangeTextField(String inputText) {
  titleInput = inputText;
}*/

class _NewExpenceState extends State<NewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _pickedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();

    _pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: now);
    setState(() {});
    /*.then((value) {
      setState(() {
        _pickedDate = value!;
      })

      return null;
    });*/
  }

  Category _chosenCategory = Category.leisure;
  void _submitForm() {
    // ignore: no_leading_underscores_for_local_identifiers
    double? _amount = double.tryParse(_amountController.text);
    if (_titleController.text.trim().isEmpty ||
        _amount == null ||
        _amount <= 0 ||
        _pickedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('invalid input'),
              content: const Text('lkjdflghajfhglkjsdhglkjsh lkjsdfhgldkjdgfh'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('okay'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _onChangeTextField,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "title",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  // onChanged: _onChangeTextField,

                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    prefix: Text('\$'),
                    label: Text(
                      "amount",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_pickedDate != null
                        ? formatter.format(_pickedDate!)
                        : 'no selected date'),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _chosenCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _chosenCategory = value;
                    });

                    // }
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("save expense"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"))
            ],
          ),
        ],
      ),
    );
  }
}
