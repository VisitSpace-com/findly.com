import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../assets/pl_items.dart';

import '../providers/non_operating_income_items_provider.dart';
import '../providers/non_operating_expense_items_provider.dart';
import '../providers/sales_items_provider.dart';
import '../providers/operating_cost_items_provider.dart';
import '../providers/cost_of_sales_items_provider.dart';

import '../selected_account_items/selected_sales_items.dart';
import '../selected_account_items/selected_cost_of_sales_items.dart';
import '../selected_account_items/selected_operating_cost_items.dart';
import '../selected_account_items/selected_non_operating_income_items.dart';
import '../selected_account_items/selected_non_operating_expense_items.dart';
import '../selected_account_items/selected_extraordinary_income_items.dart';
import '../selected_account_items/selected_extraordinary_loss_items.dart';
import '../providers/extraordinary_income_items_provider.dart';
import '../providers/extraordinary_loss_items_provider.dart';

import '../excel/create_button.dart';

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
    final selectedSalesItems = ref.watch(salesItemsProvider);
    final salesItemsNotifier = ref.read(salesItemsProvider.notifier);

    final selectedCostOfSalesItems = ref.watch(costOfSalesItemsProvider);
    final costOfSalesItemsNotifier =
        ref.read(costOfSalesItemsProvider.notifier);

    final selectedOperatingCostItems = ref.watch(operatingCostItemsProvider);
    final operatingCostItemsNotifier =
        ref.read(operatingCostItemsProvider.notifier);

    final selectedNonOperatingIncomeItems =
        ref.watch(nonOperatingIncomeItemsProvider);
    final nonOperatingIncomeItemsNotifier =
        ref.read(nonOperatingIncomeItemsProvider.notifier);

    final selectedNonOperatingExpenseItems =
        ref.watch(nonOperatingExpenseItemsProvider);
    final nonOperatingExpenseItemsNotifier =
        ref.read(nonOperatingExpenseItemsProvider.notifier);

    final selectedExtraordinaryIncomeItems =
        ref.watch(extraordinaryIncomeItemsProvider);
    final extraordinaryIncomeItemsNotifier =
        ref.read(extraordinaryIncomeItemsProvider.notifier);

    final selectedExtraordinaryLossItems =
        ref.watch(extraordinaryLossItemsProvider);
    final extraordinaryLossItemsNotifier =
        ref.read(extraordinaryLossItemsProvider.notifier);

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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(
                        PLItems.salesItems.japaneseName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SelectedSalesItems(
                        selectedAccountItems: selectedSalesItems,
                        notifier: salesItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(
                        PLItems.costOfSalesItems.japaneseName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SelectedCostOfSalesItems(
                        selectedAccountItems: selectedCostOfSalesItems,
                        notifier: costOfSalesItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(PLItems.operatingCostItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SelectedOperatingCostItems(
                        selectedAccountItems: selectedOperatingCostItems,
                        notifier: operatingCostItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(PLItems.nonOperatingIncomeItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SelectedNonOperatingIncomeItems(
                        selectedAccountItems: selectedNonOperatingIncomeItems,
                        notifier: nonOperatingIncomeItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(PLItems.nonOperatingExpenseItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SelectedNonOperatingExpenseItems(
                        selectedAccountItems: selectedNonOperatingExpenseItems,
                        notifier: nonOperatingExpenseItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child: Text(PLItems.extraordinaryIncomeItems.japaneseName,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SelectedExtraordinaryIncomeItems(
                        selectedAccountItems: selectedExtraordinaryIncomeItems,
                        notifier: extraordinaryIncomeItemsNotifier),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 8.0, left: 24),
                      child:
                          Text(PLItems.extraordinaryExpenseItems.japaneseName,
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                    ),
                    SelectedExtraordinaryLossItems(
                        selectedAccountItems: selectedExtraordinaryLossItems,
                        notifier: extraordinaryLossItemsNotifier),
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
