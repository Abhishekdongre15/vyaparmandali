// Create the Widget for the row
import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/data_entry/data_entry_view.dart';
import 'package:vyaparmandali/views/master/ac_master_view.dart';
import 'package:vyaparmandali/views/master/codes/group_master_list_view.dart';
import 'package:get/get.dart';
import 'package:vyaparmandali/views/master/codes/narration_view.dart';
import 'package:vyaparmandali/views/master/items/hamali_exp_view.dart';
import 'package:vyaparmandali/views/master/items/item_exp_view.dart';
import 'package:vyaparmandali/views/master/items/item_view.dart';
import 'package:vyaparmandali/views/master/place_master_view.dart';
import 'package:vyaparmandali/views/report/additional%20report/apmc_daily_report_view.dart';
import 'package:vyaparmandali/views/report/additional%20report/gb_daily_report_view.dart';
import 'package:vyaparmandali/views/report/additional%20report/gb_monthly_report_view.dart';
import 'package:vyaparmandali/views/report/additional%20report/vachatwise_daily_report_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/bank_book_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/bank_reco_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/cash_limit_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/cashbook_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/daily_cash_balance_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/rojmel_as_book_view.dart';
import 'package:vyaparmandali/views/report/customer%20report/ledger_sale_os_report_view.dart';
import 'package:vyaparmandali/views/report/customer%20report/ledger_sales_os_label_report_view.dart';
import 'package:vyaparmandali/views/report/ledgers/customer_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/daywise_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/general_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/group_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/itemwise_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/monthlywise_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/screen_ledger_view.dart';
import 'package:vyaparmandali/views/report/ledgers/supplier_ledger_view.dart';
import 'package:vyaparmandali/views/report/registers/aavak_register_view.dart';
import 'package:vyaparmandali/views/report/registers/itemwise_sales_repost_view.dart';
import 'package:vyaparmandali/views/report/registers/lotwise_dhara_register_view.dart';
import 'package:vyaparmandali/views/report/registers/purchase_register_view.dart';
import 'package:vyaparmandali/views/report/registers/sales_register_view.dart';
import 'package:vyaparmandali/views/report/registers/sales_summery_monthly_repost_view.dart';
import 'package:vyaparmandali/views/report/transport%20report/transportwise_patti_date_os_view.dart';
import 'package:vyaparmandali/views/report/vacchat%20report/patti_register_view.dart';
import '../views/report/additional report/monthwise_p&l_report_view.dart';
import '../views/report/additional report/vachatwise_report_view.dart';
import '../views/report/additional report/vachatwise_summery_report_view.dart';
import '../views/report/cash bank book/day_wise_bank_book_view.dart';
import '../views/report/cash bank book/rojmel_ac_view.dart';
import '../views/report/customer report/ledger_sales_os_90_day_report_view.dart';
import '../views/report/customer report/partywise_sales_report_view.dart';
import '../views/report/ledgers/detail_ledger_view.dart';
import '../views/report/ledgers/statement_of_account_view.dart';
import '../views/report/registers/dhada_register_view.dart';
import '../views/report/registers/sales_summery_repost_view.dart';
import '../views/report/transport report/transport_comm_report_view.dart';
import '../views/report/transport report/transport_report_view.dart';
import '../views/report/transport report/transportwise_patti_os_view.dart';
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
        Get.to(RojmelAcView());
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
        Get.to(DayWiseBankBookView());
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

      /// Ledger Screens Started.
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
      case 'suppliers ledger':
        Get.to(SupplierLedgerView());
        break;
      case 'itemwise ledger':
        Get.to(ItemWiseLedgerView());
        break;
      case 'daywise ledger':
        Get.to(DayWiseLedgerView());
        break;
      case 'month wise ledger':
        Get.to(MonthlyWiseLedgerView());
        break;
      //    Ledger Screen Ended

      /// Register Screen Started
      case 'aavak register':
        Get.to(AavakRegisterView());
        break;
      case 'dhada register':
        Get.to(DhadaRegisterView());
        break;
      case 'sales register':
        Get.to(SalesRegisterView());
        break;
      case 'purchase register':
        Get.to(PurchaseRegisterView());
        break;
      case 'lotwise dhada register':
        Get.to(LotwiseDhadaRegisterView());
        break;
      case 'sales summery repost':
        Get.to(SalesSummeryRepostView());
        break;
      case 'itemwise sales repost':
        Get.to(ItemwiseSalesRepostView());
        break;
      case 'sales summery monthly repost':
        Get.to(SalesSummeryMonthlyRepostView());
        break;
      // Register Screen Ended

      /// Transport Screen Started
      case 'transport report':
        Get.to(TransportReportView());
        break;
      case 'transport comm report':
        Get.to(TransportCommReportView());
        break;
      case 'transport wise patti o/s':
        Get.to(TransportWisePattiOSRepostView());
        break;
      case 'transport wise patti date o/s':
        Get.to(TransportWisePattiDateOSRepostView());
        break;
      // Transport Screen Ended

      /// Additional Report Started
      case 'apmc daily report':
        Get.to(APMCDailyReportView());
        break;
      case 'vachhatwise daily report':
        Get.to(VachatWiseDailyReportView());
        break;
      case 'monthwise p & l report':
        Get.to(MonthWisePLReportView());
        break;
      case 'vachhatwise report':
        Get.to(VachatWiseReportView());
        break;
      case 'vachhatwise summery report':
        Get.to(VachatWiseSummeryReportView());
        break;
      case 'gb daily report':
        Get.to(GbDailyReportView());
        break;
      case 'gb monthly report':
        Get.to(GbMonthlyReportView());
        break;
      // Additional Report Ended

      /// Customers Report Screen Started
      case 'ledger sales o/s report':
        Get.to(LedgerSaleOSRepostView());
        break;
      case 'ledger sales o/s label report':
        Get.to(LedgerOSLabelRepostView());
        break;
      case 'partywise sales report':
        Get.to(PartywiseWiseSalesReportView());
        break;
      case 'ledger sales o/s 90 days report':
        Get.to(LedgerOS90DayRepostView());
        break;
      // Customers Report Screen Ended
    }
  }
}
