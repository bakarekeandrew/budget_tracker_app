import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/category_screen/category_fetcher.dart';
import '../widgets/expense_form.dart';
import '../models/theme_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const name = '/category_screen'; // for routes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ThemeProvider.surfaceLight,
              Color(0xFFF1F5F9),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern App Bar
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Smart Expenses',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: ThemeProvider.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Track your spending wisely',
                            style: TextStyle(
                              fontSize: 16,
                              color: ThemeProvider.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                ThemeProvider.primaryPurple,
                                ThemeProvider.primaryPink,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: IconButton(
                            icon: Icon(
                              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              themeProvider.toggleTheme(!themeProvider.isDarkMode);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const CategoryFetcher(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              ThemeProvider.primaryPurple,
              ThemeProvider.primaryPink,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ThemeProvider.primaryPurple.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const ExpenseForm(),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
