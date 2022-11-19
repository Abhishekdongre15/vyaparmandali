// Create the Widget for the row
import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/data_entry/data_entry_view.dart';
import 'package:vyaparmandali/views/master/ac_master_view.dart';
import 'package:vyaparmandali/views/master/codes/group_master_list_view.dart';
import 'package:vyaparmandali/views/list_data_view.dart';
import 'package:get/get.dart';
import 'package:vyaparmandali/views/master/codes/narration_view.dart';
import 'package:vyaparmandali/views/master/items/hamali_exp_view.dart';
import 'package:vyaparmandali/views/master/items/item_exp_view.dart';
import 'package:vyaparmandali/views/master/items/item_view.dart';
import 'package:vyaparmandali/views/master/place_master_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/bank_book_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/bank_reco_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/cash_limit_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/cashbook_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/daily_cash_balance_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/rojmel_as_book_view.dart';
import 'package:vyaparmandali/views/report/ledgers/customer_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/general_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/group_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/screen_ledger_view.dart';
import 'package:vyaparmandali/views/report/vacchat%20report/patti_register_view.dart';
import '../views/report/cash bank book/daily_wise_bank_book_view.dart';
import '../views/report/cash bank book/journal_view.dart';
import '../views/report/ledgers/detail_ledger_view.dart';
import '../views/report/ledgers/statement_of_account_view.dart';
import '../views/report/vacchat report/jama_nondh.dart';
import '../views/report/vacchat report/jama_nondh_summery_monthly_view.dart';
import '../views/report/vacchat report/jama_nondh_summery_view.dart';
import 'Entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);

  final Entry entry;
  final BuildContext context;

// This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: GestureDetector(
            onTap: () {
              /* if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupMasterListView(),));

              }else if() {

              }*/

              callPages(root.title.toLowerCase());
            },
            child: Text(
              root.title,
            )),
      );
    } else {
      return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: GestureDetector(
            onTap: () {
              if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const GroupMasterListView(),
                //   ),
                // );
                Get.to(GroupMasterListView());
              }
            },
            child: GestureDetector(
              onTap: () {
                if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GroupMasterListView(),
                      ));
                }
              },
              child: Text(
                root.title,
                style: ToolkitTypography.body1A
                    .copyWith(color: ToolkitColors.black),
              ),
            )),
        children: root.children.map<Widget>(_buildTiles).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  void callPages(String pages) {
    switch (pages) {
      case 'group':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GroupMasterListView(),
            ));
        break;
      case 'narration':
        Get.to(NarrationView());
        break;
      case 'a/c master':
        Get.to(ACMasterListView());
        break;
      case 'item name':
        Get.to(ItemView());
        break;
      case 'item exp':
        Get.to(ItemExpView());
        break;
      case 'hamali exp':
        Get.to(HamaliExpView());
        break;
      case 'place master':
        Get.to(PlaceMasterView());
        break;
      case 'rojmel':
        Get.to(DataEntryView());
        break;
      case 'rojmel as a/c':
        Get.to(JournalView());
        break;
      case 'rojmel as book':
        Get.to(RojmelAsBook());
        break;
      case 'cash boook':
        Get.to(CashbookView());
        break;
      case 'bank book':
        Get.to(BankBookView());
        break;
      case 'daily cash balance':
        Get.to(DailyCashBalanceView());
        break;
      case 'day wise bank book':
        Get.to(DailyWiseBankBookView());
        break;
      case 'bank reco':
        Get.to(BankRecoView());
        break;
      case 'cash limits report':
        Get.to(CashLimitView());
        break;
      case 'patti register':
        Get.to(PattiRegisterView());
        break;
      case 'jama nondh':
        Get.to(JamaNondhView());
        break;
      case 'jama nondh summery':
        Get.to(JamaNondhSummeryView());
        break;
      case 'jama nondh summery monthly':
        Get.to(JamaNondhSummeryMonthlyView());
        break;
      case 'general ledger':
        Get.to(GeneralLedgerView());
        break;
      case 'statement of accounts':
        Get.to(StatementOfAccountView());
        break;
      case 'screen ledger':
        Get.to(ScreenLedgerView());
        break;
      case 'detail ledger':
        Get.to(DetailLedgerView());
        break;
      case 'group ledger':
        Get.to(GroupLedgerView());
        break;
      case 'customer ledger':
        Get.to(CustomerLedgerView());
        break;
    }
  }
}
