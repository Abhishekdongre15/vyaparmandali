// Create the Widget for the row
import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/balance_sheet/schedules_details_screen_view.dart';
import 'package:vyaparmandali/views/balance_sheet/trial_balance_report_view.dart';
import 'package:vyaparmandali/views/balance_sheet/eoy_kasar_dr_view.dart';
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
import 'package:vyaparmandali/views/report/additional%20report/gb_monthly_entry_report_view.dart';
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
import '../views/balance_sheet/balance_sheets_report_view.dart';
import '../views/balance_sheet/eoy_kasar_cr_view.dart';
import '../views/balance_sheet/p_and_l_statement_view.dart';
import '../views/balance_sheet/schedules_report_view.dart';
import '../views/balance_sheet/trial_balance_detail_screen_view.dart';
import '../views/master/items/account_setting_view.dart';
import '../views/report/additional report/monthwise_pnl_report_view.dart';
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
import 'entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context, {super.key});

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
        title: Text(
          root.title,
          style: ToolkitTypography.body1A
              .copyWith(color: ToolkitColors.black),
        ),
        children: root.children.map<Widget>(_buildTiles).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  void callPages(String pages) async{
    switch (pages) {
      case 'group':
        await Get.to(const GroupMasterListView())?.then((value) =>  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GroupMasterListView(),
            )));
        break;
      case 'narration':
        Get.to(const NarrationView());
        break;
      case 'a/c master':
        Get.to(const ACMasterListView());
        break;
      case 'item name':
        Get.to(const ItemView());
        break;
      case 'item exp':
        Get.to(const ItemExpView());
        break;
      case 'hamali exp':
        Get.to(const HamaliExpView());
        break;
      case 'place master':
        Get.to(const PlaceMasterView());
        break;
      case 'a/c settings':
        Get.to(const AccountSettingView());
        break;

      /// Master Screen Ended

      case 'rojmel':
        Get.to(const DataEntryView());
        break;
      case 'rojmel as a/c':
        Get.to(const RojmelAcView());
        break;
      case 'rojmel as book':
        Get.to(const RojmelAsBook());
        break;
      case 'cash boook':
        Get.to(const CashbookView());
        break;
      case 'bank book':
        Get.to(const BankBookView());
        break;
      case 'daily cash balance':
        Get.to(const DailyCashBalanceView());
        break;
      case 'day wise bank book':
        Get.to(const DayWiseBankBookView());
        break;
      case 'bank reco':
        Get.to(const BankRecoView());
        break;
      case 'cash limits report':
        Get.to(const CashLimitView());
        break;
      case 'patti register':
        Get.to(const PattiRegisterView());
        break;
      case 'jama nondh':
        Get.to(const JamaNondhView());
        break;
      case 'jama nondh summery':
        Get.to(const JamaNondhSummeryView());
        break;
      case 'jama nondh summery monthly':
        Get.to(const JamaNondhSummeryMonthlyView());
        break;

      /// Ledger Screens Started.
      case 'general ledger':
        Get.to(const GeneralLedgerView());
        break;
      case 'statement of accounts':
        Get.to(const StatementOfAccountView());
        break;
      case 'screen ledger':
        Get.to(const ScreenLedgerView());
        break;
      case 'detail ledger':
        Get.to(const DetailLedgerView());
        break;
      case 'group ledger':
        Get.to(const GroupLedgerView());
        break;
      case 'customer ledger':
        Get.to(const CustomerLedgerView());
        break;
      case 'suppliers ledger':
        Get.to(const SupplierLedgerView());
        break;
      case 'itemwise ledger':
        Get.to(const ItemWiseLedgerView());
        break;
      case 'daywise ledger':
        Get.to(const DayWiseLedgerView());
        break;
      case 'month wise ledger':
        Get.to(const MonthlyWiseLedgerView());
        break;
      //    Ledger Screen Ended

      /// Register Screen Started
      case 'aavak register':
        Get.to(const AavakRegisterView());
        break;
      case 'dhada register':
        Get.to(const DhadaRegisterView());
        break;
      case 'sales register':
        Get.to(const SalesRegisterView());
        break;
      case 'purchase register':
        Get.to(const PurchaseRegisterView());
        break;
      case 'lotwise dhada register':
        Get.to(const LotwiseDhadaRegisterView());
        break;
      case 'sales summery repost':
        Get.to(const SalesSummeryRepostView());
        break;
      case 'itemwise sales repost':
        Get.to(const ItemwiseSalesRepostView());
        break;
      case 'sales summery monthly repost':
        Get.to(const SalesSummeryMonthlyRepostView());
        break;
      // Register Screen Ended

      /// Transport Screen Started
      case 'transport report':
        Get.to(const TransportReportView());
        break;
      case 'transport comm report':
        Get.to(const TransportCommReportView());
        break;
      case 'transport wise patti o/s':
        Get.to(const TransportWisePattiOSRepostView());
        break;
      case 'transport wise patti date o/s':
        Get.to(const TransportWisePattiDateOSRepostView());
        break;
      // Transport Screen Ended

      /// Additional Report Started
      case 'apmc daily report':
        Get.to(const APMCDailyReportView());
        break;
      case 'vachhatwise daily report':
        Get.to(const VachatWiseDailyReportView());
        break;
      case 'monthwise p & l report':
        Get.to(const MonthWisePLReportView());
        break;
      case 'vachhatwise report':
        Get.to(const VachatWiseReportView());
        break;
      case 'vachhatwise summery report':
        Get.to(const VachatWiseSummeryReportView());
        break;
      case 'gb daily report':
        Get.to(const GbDailyReportView());
        break;
      case 'gb monthly entry report':
        Get.to(const GbMonthlyEntryReportView());
        break;
      // Additional Report Ended

      /// Customers Report Screen Started
      case 'ledger sales o/s report':
        Get.to(const LedgerSaleOSRepostView());
        break;
      case 'ledger sales o/s label report':
        Get.to(const LedgerOSLabelRepostView());
        break;
      case 'partywise sales report':
        Get.to(const PartywiseWiseSalesReportView());
        break;
      case 'ledger sales o/s 90 days report':
        Get.to(const LedgerOS90DayRepostView());
        break;
      // Customers Report Screen Ended

      /// Balance Sheet Report Screen Started
      case 'p & l statement report':
        Get.to(const PandLStatementView());
        break;
      case 'trial balance report':
        Get.to(const TrialBalanceView());
        break;
      case 'schedules report':
        Get.to(const SchedulesReportView());
        break;
      case 'balance sheets report':
        Get.to(const BalanceSheetReportView());
        break;
      case 'trial balance details screen':
        Get.to(const TrialBalanceDetailScreenView());
        break;
      case 'eoy kasar dr  group wise':
        Get.to(const EOYKasarDrGroupView());
        break;
      case 'eoy kasar cr group wise':
        Get.to(const EOYKasarCrGroupView());
        break;
      case 'schedules details screen':
        Get.to(const SchedulesDetailScreenView());
        break;
    }
  }
}
