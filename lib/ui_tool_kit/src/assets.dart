import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/static.dart';

enum ToolkitAssets {
  // 8px icon
  iconForwardArrow8,
  // 16 px icons
  iconCard16,
  iconCopy16,
  iconEyeSlash16,
  iconEye16,
  iconRoundup16,
  iconShare16,
  iconSmallChevron,

  // 44 px icons
  iconArrowBack44,
  editIcon44,
  iconArrowForward44,
  iconCheckmark44,
  iconClose44,
  iconCopyBG44,
  iconCopyNoBG44,
  iconCopy44,
  iconDownload44,
  iconEyeBG44,
  iconEyeSlashBG44,
  iconEyeSlash44,
  iconEye44,
  iconIosBack44,
  iconIosDown44,
  iconIosForward44,
  iconIosUp44,
  iconMoreHorizontal44,
  iconMoreVertical44,
  iconShare44,
  iconTrash44,

  // bottom navigation active icons
  iconInsightActive,
  iconPerksActive,
  iconProfileActive,
  iconSearchActive,
  iconWalletActive,

  // bottom navigation inactive icons
  iconInsightInactive,
  iconPerksInactive,
  iconProfileInactive,
  iconSearchInactive,
  iconWalletInactive,

  // card controls
  iconCardFrontView,
  iconPotView,
  iconHibernateCardFrontView,
  iconCardBackView,
  iconActiveCardView,
  iconCardFreezeOverlay,
  iconCardPot,
  iconFreeze,
  iconOrderCard,
  lineDots,
  iconSettings,
  iconCardBackSymbol,
  iconCardBackSymbolLabel,

  // form
  iconFormClear,
  iconFormSearch,

  // illustration
  iconIllustrationImage,
  iconIllustrationInbox,
  iconFingerprint,
  iconFaceId,

  //bee info illustration
  beeInfoAddAddress,
  beeInfoEmail,
  beeInfoEmployeeStatus,
  beeInfoMobileNumber,
  beeInfoAddPreferredName,
  beeInfoSteps,

  // logo
  iconLogoLarge,
  iconLogoLargeWhite,
  iconLogoSmall,
  iconLogoBlank,

  // navigation
  iconGridViewSelected,
  iconGridViewUnselected,
  iconListViewSelected,
  iconListViewUnselected,

  // other
  iconOtherExclamation,
  iconOtherInternet,
  iconOtherQuestion,
  iconOtherSuccess,
  iconOtherX,
  iconCheckIdAgain,
  iconExistingCustomer,
  iconTermsAndConditions,

  // profile settings
  iconCustomerSupport,
  iconLegalDocument,
  iconLimit,
  iconNotificationPreferences,
  iconPersonalInformation,
  iconPreferences,
  iconSecurity,
  iconStatement,
  iconHibernate,

  // roundup
  iconHexagonCheck,
  iconHexagonExclamation,
  iconHexagonQuestion,
  iconHexagonUmbrella,
  iconPlusButton,
  iconSampleImage,
  iconSinglePCAImage,

  // placeholder

  // passcode
  iconPassCodeBackSpace,
  iconPassCodeFingerPrint,
  iconClose,
  iconCheck,
  // Hibernate
  iconWakeUpAccount,
  iconBeforeHibernate,
  iconWaitingPerson,
  iconHibernateGreyCard,
  iconWakeUpAccountWhite,
  iconHibernateListCard,

  //Benefits
  benefitRate,
  benefitVirtualDebitCards,
  benefitApplePayAndGooglePay,
  benefitPots,
  benefitRoundUps,
  benefitInstantNotifications,
  benefitUKTransfers,
  benefitInAppChatSupport,

  // Support
  appTopic,
  accountTopic,
  paymentsTopic,
  cardsTopic,

  // Password Recovery
  camera,
}

extension ToolkitAssetsConfig on ToolkitAssets {
  Widget widget({
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
    VoidCallback? onTap,
    BoxShape? shape,
    List<BoxShadow>? boxShadow,
  }) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(ToolkitColors.secondary.withOpacity(0.1)),
      child: boxShadow != null
          ? Container(
              child: _buildImage(height, width, color, fit),
              decoration: BoxDecoration(
                shape: shape ?? BoxShape.circle,
                boxShadow: boxShadow,
              ),
            )
          : _buildImage(height, width, color, fit),
    );
  }

  String get path {
    switch (this) {
      // Logo
      case ToolkitAssets.iconLogoLarge:
        return 'assets/logo/large.svg';
      case ToolkitAssets.iconLogoLargeWhite:
        return 'assets/logo/large-white.svg';
      case ToolkitAssets.iconLogoSmall:
        return 'assets/logo/small.svg';
      case ToolkitAssets.iconLogoBlank:
        return 'assets/logo/small-blank.svg';

      // bottom navigation
      case ToolkitAssets.iconInsightActive:
        return 'assets/bottom-navigation/insight-active.svg';
      case ToolkitAssets.iconInsightInactive:
        return 'assets/bottom-navigation/insight-inactive.svg';
      case ToolkitAssets.iconPerksActive:
        return 'assets/bottom-navigation/perks-active.svg';
      case ToolkitAssets.iconPerksInactive:
        return 'assets/bottom-navigation/perks-inactive.svg';
      case ToolkitAssets.iconProfileActive:
        return 'assets/bottom-navigation/profile-active.svg';
      case ToolkitAssets.iconProfileInactive:
        return 'assets/bottom-navigation/profile-inactive.svg';
      case ToolkitAssets.iconSearchActive:
        return 'assets/bottom-navigation/search-active.svg';
      case ToolkitAssets.iconSearchInactive:
        return 'assets/bottom-navigation/search-inactive.svg';
      case ToolkitAssets.iconWalletActive:
        return 'assets/bottom-navigation/wallet-active.svg';
      case ToolkitAssets.iconWalletInactive:
        return 'assets/bottom-navigation/wallet-inactive.svg';

      // navigation
      case ToolkitAssets.iconGridViewSelected:
        return 'assets/navigation/gridview-selected.svg';
      case ToolkitAssets.iconGridViewUnselected:
        return 'assets/navigation/gridview-unselected.svg';
      case ToolkitAssets.iconListViewSelected:
        return 'assets/navigation/listview-selected.svg';
      case ToolkitAssets.iconListViewUnselected:
        return 'assets/navigation/listview-unselected.svg';

      //profile settings
      case ToolkitAssets.iconPreferences:
        return 'assets/profile-settings/preferences.svg';
      case ToolkitAssets.iconNotificationPreferences:
        return 'assets/profile-settings/notification-preferences.svg';
      case ToolkitAssets.iconSecurity:
        return 'assets/profile-settings/security.svg';
      case ToolkitAssets.iconLimit:
        return 'assets/profile-settings/limit.svg';
      case ToolkitAssets.iconStatement:
        return 'assets/profile-settings/statement.svg';
      case ToolkitAssets.iconPersonalInformation:
        return 'assets/profile-settings/personal-info.svg';
      case ToolkitAssets.iconCustomerSupport:
        return 'assets/profile-settings/customer-support.svg';
      case ToolkitAssets.iconLegalDocument:
        return 'assets/profile-settings/legal-document.svg';
      case ToolkitAssets.iconHibernate:
        return 'assets/profile-settings/hibernate.svg';
      case ToolkitAssets.iconHibernateListCard:
        return 'assets/hibernate/hibernate_gray_list_card.svg';

      // form
      case ToolkitAssets.iconFormClear:
        return 'assets/form/clear.svg';
      case ToolkitAssets.iconFormSearch:
        return 'assets/form/search.svg';

      // illustration
      case ToolkitAssets.iconIllustrationImage:
        return 'assets/illustration/image.svg';
      case ToolkitAssets.iconIllustrationInbox:
        return 'assets/illustration/inbox.svg';
      case ToolkitAssets.iconFingerprint:
        return 'assets/illustration/fingerprint.svg';
      case ToolkitAssets.iconFaceId:
        return 'assets/illustration/face-id.svg';

      // bee info illustration
      case ToolkitAssets.beeInfoAddAddress:
        return 'assets/illustration/bee_info_add_address.svg';
      case ToolkitAssets.beeInfoEmail:
        return 'assets/illustration/bee_info_email.svg';
      case ToolkitAssets.beeInfoEmployeeStatus:
        return 'assets/illustration/bee_info_employee_status.svg';
      case ToolkitAssets.beeInfoMobileNumber:
        return 'assets/illustration/bee_info_mobile_number.svg';
      case ToolkitAssets.beeInfoAddPreferredName:
        return 'assets/illustration/bee_info_preferred_name.svg';
      case ToolkitAssets.beeInfoSteps:
        return 'assets/illustration/bee_info_steps.svg';

      // 8 px icons
      case ToolkitAssets.iconForwardArrow8:
        return 'assets/8px/forward-arrow.svg';
      // 16 px icons
      case ToolkitAssets.iconCard16:
        return 'assets/16px/card.svg';
      case ToolkitAssets.iconCopy16:
        return 'assets/16px/copy.svg';
      case ToolkitAssets.iconEyeSlash16:
        return 'assets/16px/eye-slash.svg';
      case ToolkitAssets.iconEye16:
        return 'assets/16px/eye.svg';
      case ToolkitAssets.iconRoundup16:
        return 'assets/16px/roundup.svg';
      case ToolkitAssets.iconShare16:
        return 'assets/16px/share.svg';
      case ToolkitAssets.iconSmallChevron:
        return 'assets/small_button_chevron.svg';

      // 44 px icons
      case ToolkitAssets.iconArrowBack44:
        return 'assets/44px/arrow-back.svg';
      case ToolkitAssets.editIcon44:
        return 'assets/44px/edit.svg';
      case ToolkitAssets.iconArrowForward44:
        return 'assets/44px/arrow-forward.svg';
      case ToolkitAssets.iconCheckmark44:
        return 'assets/44px/checkmark.svg';
      case ToolkitAssets.iconClose44:
        return 'assets/44px/close.svg';
      case ToolkitAssets.iconCopyBG44:
        return 'assets/44px/copy-background.svg';
      case ToolkitAssets.iconCopyNoBG44:
        return 'assets/44px/copy-no-background.svg';
      case ToolkitAssets.iconCopy44:
        return 'assets/44px/copy.svg';
      case ToolkitAssets.iconDownload44:
        return 'assets/44px/download.svg';
      case ToolkitAssets.iconEyeBG44:
        return 'assets/44px/eye-background.svg';
      case ToolkitAssets.iconEyeSlashBG44:
        return 'assets/44px/eye-slash-background.svg';
      case ToolkitAssets.iconEyeSlash44:
        return 'assets/44px/eye-slash.svg';
      case ToolkitAssets.iconEye44:
        return 'assets/44px/eye.svg';
      case ToolkitAssets.iconIosBack44:
        return 'assets/44px/ios-back.svg';
      case ToolkitAssets.iconIosDown44:
        return 'assets/44px/ios-down.svg';
      case ToolkitAssets.iconIosForward44:
        return 'assets/44px/ios-forward.svg';
      case ToolkitAssets.iconIosUp44:
        return 'assets/44px/ios-up.svg';
      case ToolkitAssets.iconMoreHorizontal44:
        return 'assets/44px/more-horizontal.svg';
      case ToolkitAssets.iconMoreVertical44:
        return 'assets/44px/more-vertical.svg';
      case ToolkitAssets.iconShare44:
        return 'assets/44px/share.svg';
      case ToolkitAssets.iconTrash44:
        return 'assets/44px/trash.svg';

      // card iconshibernate_card_front
      case ToolkitAssets.iconCardFrontView:
        return 'assets/card/card-front.png';
      case ToolkitAssets.iconPotView:
        return 'assets/card/pot_view.png';
      case ToolkitAssets.iconHibernateCardFrontView:
        return 'assets/card/hibernate_card_front.svg';
      case ToolkitAssets.iconCardBackView:
        return 'assets/card/card-back.png';
      case ToolkitAssets.iconActiveCardView:
        return 'assets/card/active-card.svg';
      case ToolkitAssets.iconCardFreezeOverlay:
        return 'assets/card/freeze.svg';
      case ToolkitAssets.iconCardPot:
        return 'assets/card/card_pot.png';
      case ToolkitAssets.iconCardBackSymbol:
        return 'assets/card/back-symbol.svg';
      case ToolkitAssets.iconCardBackSymbolLabel:
        return 'assets/card/back-symbol-label.svg';

      // card settings
      case ToolkitAssets.iconFreeze:
        return 'assets/card-settings/freeze.svg';
      case ToolkitAssets.iconOrderCard:
        return 'assets/card-settings/order-card.svg';
      case ToolkitAssets.lineDots:
        return 'assets/card-settings/line-dots.svg';
      case ToolkitAssets.iconSettings:
        return 'assets/card-settings/settings.svg';

      // roundup
      case ToolkitAssets.iconHexagonCheck:
        return 'assets/roundup/hexagon-check.svg';
      case ToolkitAssets.iconHexagonExclamation:
        return 'assets/roundup/hexagon-exclamation.svg';
      case ToolkitAssets.iconHexagonQuestion:
        return 'assets/roundup/hexagon-question.svg';
      case ToolkitAssets.iconHexagonUmbrella:
        return 'assets/roundup/hexagon-umbrella.svg';
      case ToolkitAssets.iconPlusButton:
        return 'assets/roundup/plus-button.svg';
      case ToolkitAssets.iconSampleImage:
        return 'assets/roundup/sample-image.svg';
      case ToolkitAssets.iconSinglePCAImage:
        return 'assets/roundup/card_carousel.svg';

      // other
      case ToolkitAssets.iconOtherExclamation:
        return 'assets/other/exclamation.svg';
      case ToolkitAssets.iconOtherInternet:
        return 'assets/other/internet.svg';
      case ToolkitAssets.iconOtherQuestion:
        return 'assets/other/question.svg';
      case ToolkitAssets.iconOtherSuccess:
        return 'assets/other/success.svg';
      case ToolkitAssets.iconOtherX:
        return 'assets/other/X.svg';
      case ToolkitAssets.iconCheckIdAgain:
        return 'assets/other/check_id_again.svg';
      case ToolkitAssets.iconExistingCustomer:
        return 'assets/other/existing_customer.svg';
      case ToolkitAssets.iconTermsAndConditions:
        return 'assets/other/terms_and_condition.svg';
      case ToolkitAssets.iconWaitingPerson:
        return 'assets/other/waiting_person.svg';

      // passcode

      case ToolkitAssets.iconPassCodeBackSpace:
        return 'assets/passcode/back_space.svg';
      case ToolkitAssets.iconPassCodeFingerPrint:
        return 'assets/passcode/fingerprint.svg';
      case ToolkitAssets.iconClose:
        return 'assets/close.png';
      case ToolkitAssets.iconCheck:
        return 'assets/check.png';

      //Hibernate
      case ToolkitAssets.iconWakeUpAccount:
        return 'assets/hibernate/wakeup_account.svg';
      case ToolkitAssets.iconBeforeHibernate:
        return 'assets/hibernate/before_hibernate.svg';
      case ToolkitAssets.iconHibernateGreyCard:
        return 'assets/hibernate/hibernate_grey_card.svg';
      case ToolkitAssets.iconWakeUpAccountWhite:
        return 'assets/hibernate/wakeup_account_white.svg';

      //Benefits
      case ToolkitAssets.benefitRate:
        return 'assets/benefits/benefitRate.svg';
      case ToolkitAssets.benefitVirtualDebitCards:
        return 'assets/benefits/benefitVirtualDebitCards.svg';
      case ToolkitAssets.benefitApplePayAndGooglePay:
        return 'assets/benefits/benefitApplePayAndGooglePay.svg';
      case ToolkitAssets.benefitPots:
        return 'assets/benefits/benefitPots.svg';
      case ToolkitAssets.benefitRoundUps:
        return 'assets/benefits/benefitRoundUps.svg';
      case ToolkitAssets.benefitInstantNotifications:
        return 'assets/benefits/benefitInstantNotifications.svg';
      case ToolkitAssets.benefitUKTransfers:
        return 'assets/benefits/benefitUKTransfers.svg';
      case ToolkitAssets.benefitInAppChatSupport:
        return 'assets/benefits/benefitInAppChatSupport.svg';

      // Support
      case ToolkitAssets.appTopic:
        return 'assets/support/app-topic.svg';
      case ToolkitAssets.accountTopic:
        return 'assets/support/account-topic.svg';
      case ToolkitAssets.paymentsTopic:
        return 'assets/support/payments-topic.svg';
      case ToolkitAssets.cardsTopic:
        return 'assets/support/cards-topic.svg';

      case ToolkitAssets.camera:
        return 'assets/camera.svg';
    }
  }

  Widget _buildImage(double? height, double? width, Color? color, BoxFit? fit) {
    if (path.contains('.svg')) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        color: color,
        fit: fit ?? BoxFit.cover,
        package: packageToolkit,
      );
    }

    return Image.asset(
      path,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.cover,
      package: packageToolkit,
    );
  }
}
