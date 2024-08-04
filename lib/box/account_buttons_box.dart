import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'account_items_box.dart';
import '../providers/account_item_index_provider.dart';

import '../items_button/sales_items_button.dart';
import '../items_button/cost_of_sales_items_button.dart';
import '../items_button/operating_cost_items_button.dart';
import '../items_button/non_operating_income_items_button.dart';
import '../items_button/non_operating_expenses_items_button.dart';
import '../items_button/extraordinary_income_items_button.dart';
import '../items_button/extraordinary_loss_items_button.dart';

class AccountsButtonBox extends ConsumerStatefulWidget {
  const AccountsButtonBox({super.key});

  @override
  ConsumerState<AccountsButtonBox> createState() => _AccountsButtonBoxState();
}

class _AccountsButtonBoxState extends ConsumerState<AccountsButtonBox> {
  // final notifier = selectedAccountItemIndexProvider.notifier;

  List<Widget> itemsButton(BuildContext context, int selectedIndex) => [
        const SalesItemsButton(),
        const CostOfSalesItemsButton(),
        const OperatingCostItemsButton(),
        const NonOperatingIncomeItemsButton(),
        const NonOperatingExpensesItemsButton(),
        const ExtraordinaryIncomeItemsButton(),
        const ExtraordinaryLossItemsButton(),
      ];

  @override
  Widget build(BuildContext context) {
    final selectedAccountItemIndex =
        ref.watch(selectedAccountItemIndexProvider);

    return SizedBox(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: const BoxDecoration(color: Colors.black),
        child: itemsButton(
            context, selectedAccountItemIndex)[selectedAccountItemIndex],
      ),
    );
  }
}
