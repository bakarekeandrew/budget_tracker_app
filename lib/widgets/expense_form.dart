import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/database_provider.dart';
import '../constants/icons.dart';
import '../models/expense.dart';
import '../models/theme_provider.dart';

class ExpenseForm extends StatefulWidget {
  final Expense? expense;
  const ExpenseForm({super.key, this.expense});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _title.text = widget.expense!.title;
      _amount.text = widget.expense!.amount.toString();
      _date = widget.expense!.date;
      _initialValue = widget.expense!.category;
    }
  }

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _date ?? DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(
                  widget.expense == null ? Icons.add_circle : Icons.edit,
                  color: ThemeProvider.primaryPurple,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.expense == null ? 'Add New Expense' : 'Edit Expense',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeProvider.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          // Form content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title field
                  const Text(
                    'Expense Title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeProvider.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _title,
                    decoration: const InputDecoration(
                      hintText: 'Enter expense title...',
                      prefixIcon: Icon(Icons.title, color: ThemeProvider.primaryPurple),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Amount field
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeProvider.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter amount...',
                      prefixIcon: Icon(Icons.attach_money, color: ThemeProvider.primaryPurple),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Date picker
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeProvider.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: ThemeProvider.primaryPurple,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _date != null
                                ? DateFormat('MMMM dd, yyyy').format(_date!)
                                : 'Select Date',
                            style: TextStyle(
                              color: _date != null ? ThemeProvider.textPrimary : ThemeProvider.textSecondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(),
                          child: const Text(
                            'Choose',
                            style: TextStyle(
                              color: ThemeProvider.primaryPurple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Category dropdown
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeProvider.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _initialValue,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, color: ThemeProvider.primaryPurple),
                        items: icons.keys
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Icon(icons[e], color: ThemeProvider.primaryPurple, size: 20),
                                    const SizedBox(width: 12),
                                    Text(e),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _initialValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_title.text.isNotEmpty && _amount.text.isNotEmpty) {
                          final expense = Expense(
                            id: widget.expense?.id ?? 0,
                            title: _title.text,
                            amount: int.parse(_amount.text),
                            date: _date ?? DateTime.now(),
                            category: _initialValue,
                          );
                          if (widget.expense == null) {
                            provider.addExpense(expense);
                          } else {
                            provider.updateExpense(expense);
                          }
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeProvider.primaryPurple,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(widget.expense == null ? Icons.add : Icons.edit),
                          const SizedBox(width: 8),
                          Text(
                            widget.expense == null ? 'Add Expense' : 'Update Expense',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
