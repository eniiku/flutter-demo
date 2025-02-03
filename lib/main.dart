import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/screens/home_page.dart';
import 'package:todo_app/src/providers/todo_provider.dart';
import 'package:todo_app/src/themes/app_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    MaterialApp(title: "Todo App",  
    theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const HomePage())));
}
