import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './assets/constants.dart';

import 'box/account_items_box.dart';
import 'box/account_buttons_box.dart';
import 'box/excel_box.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExcelCreator(),
    );
  }
}

class ExcelCreator extends StatefulWidget {
  const ExcelCreator({super.key});

  @override
  _ExcelCreatorState createState() => _ExcelCreatorState();
}

class _ExcelCreatorState extends State<ExcelCreator> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AccountItemsBox(),
          AccountsButtonBox(),
          ExcelBox(),
        ],
      ),
      backgroundColor: ColorSet.canvasColor,
    );
  }
}
