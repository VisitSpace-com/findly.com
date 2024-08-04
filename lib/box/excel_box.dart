import 'package:findly/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../excel/listSelectedAccountItems.dart';

import '../excel/create_button.dart';

import '../providers/account_items_provider.dart';
import '../providers/operating_cost_items_provider.dart';

class ExcelBox extends ConsumerStatefulWidget {
  const ExcelBox({super.key});

  @override
  ConsumerState<ExcelBox> createState() => _ExcelBoxState();
}

class _ExcelBoxState extends ConsumerState<ExcelBox> {
  final ScrollController _scrollControllerAll = ScrollController();

  @override
  void dispose() {
    _scrollControllerAll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedOperatingCostItems = ref.watch(operatingCostItemsProvider);
    final notifier = ref.read(operatingCostItemsProvider.notifier);

    ref.listen<List<String>>(operatingCostItemsProvider, (previous, next) {
      if (previous != null && next.length > previous.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollControllerAll.animateTo(
            _scrollControllerAll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Excelイメージ
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Scrollbar(
              controller: _scrollControllerAll,
              child: SingleChildScrollView(
                controller: _scrollControllerAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text('売上高',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(AccountItems.costOfSalesItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(AccountItems.operatingCostItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    listSelectedAccountItems(
                        selectedOperatingCostItems, context, notifier),
                    // AccountItemsNotifier(),
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text('営業外収益',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text('営業外費用',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text('特別利益',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text('特別損失',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Excel出力ボタン
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.15,
            child: const Center(child: CreateButton()),
          ),
        ],
      ),
    );
  }
}
