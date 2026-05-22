import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login / Registration'**
  String get login;

  /// No description provided for @seeMor.
  ///
  /// In en, this message translates to:
  /// **'See Mor'**
  String get seeMor;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @greatservicesawait.
  ///
  /// In en, this message translates to:
  /// **'Great services await you'**
  String get greatservicesawait;

  /// No description provided for @changebKashnumber.
  ///
  /// In en, this message translates to:
  /// **'Change bKash number'**
  String get changebKashnumber;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get offer;

  /// No description provided for @otherServices.
  ///
  /// In en, this message translates to:
  /// **'Other services'**
  String get otherServices;

  /// No description provided for @bKashMenu.
  ///
  /// In en, this message translates to:
  /// **'bKash Menu'**
  String get bKashMenu;

  /// No description provided for @ava.
  ///
  /// In en, this message translates to:
  /// **'AVA'**
  String get ava;

  /// No description provided for @activevirtualassistand.
  ///
  /// In en, this message translates to:
  /// **'Active Virtual Assistand'**
  String get activevirtualassistand;

  /// No description provided for @send_money.
  ///
  /// In en, this message translates to:
  /// **'Send Money'**
  String get send_money;

  /// No description provided for @mobile_recharge.
  ///
  /// In en, this message translates to:
  /// **'Mobile Recharge'**
  String get mobile_recharge;

  /// No description provided for @cash_out.
  ///
  /// In en, this message translates to:
  /// **'Cash Out'**
  String get cash_out;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @add_money.
  ///
  /// In en, this message translates to:
  /// **'Add Money'**
  String get add_money;

  /// No description provided for @pay_bill.
  ///
  /// In en, this message translates to:
  /// **'Pay Bill'**
  String get pay_bill;

  /// No description provided for @savings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get savings;

  /// No description provided for @loan.
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get loan;

  /// No description provided for @insurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get insurance;

  /// No description provided for @bkash_to_bank.
  ///
  /// In en, this message translates to:
  /// **'bKash to Bank'**
  String get bkash_to_bank;

  /// No description provided for @education_fee.
  ///
  /// In en, this message translates to:
  /// **'Education Fee'**
  String get education_fee;

  /// No description provided for @microfinance.
  ///
  /// In en, this message translates to:
  /// **'Microfinance'**
  String get microfinance;

  /// No description provided for @toll.
  ///
  /// In en, this message translates to:
  /// **'Toll'**
  String get toll;

  /// No description provided for @request_money.
  ///
  /// In en, this message translates to:
  /// **'Request Money'**
  String get request_money;

  /// No description provided for @remittance.
  ///
  /// In en, this message translates to:
  /// **'Remittance'**
  String get remittance;

  /// No description provided for @donation.
  ///
  /// In en, this message translates to:
  /// **'Donation'**
  String get donation;

  /// No description provided for @login_or_registration.
  ///
  /// In en, this message translates to:
  /// **'Login or Register in the bKash app'**
  String get login_or_registration;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @refer_bkash_app.
  ///
  /// In en, this message translates to:
  /// **'Refer bKash App'**
  String get refer_bkash_app;

  /// No description provided for @discover_bkash.
  ///
  /// In en, this message translates to:
  /// **'Discover bKash'**
  String get discover_bkash;

  /// No description provided for @nominee_update.
  ///
  /// In en, this message translates to:
  /// **'Nominee Update'**
  String get nominee_update;

  /// No description provided for @information_update.
  ///
  /// In en, this message translates to:
  /// **'Information Update'**
  String get information_update;

  /// No description provided for @bkash_map.
  ///
  /// In en, this message translates to:
  /// **'bKash Map'**
  String get bkash_map;

  /// No description provided for @customer_service.
  ///
  /// In en, this message translates to:
  /// **'Customer Service'**
  String get customer_service;

  /// No description provided for @limit.
  ///
  /// In en, this message translates to:
  /// **'Limit'**
  String get limit;

  /// No description provided for @statements.
  ///
  /// In en, this message translates to:
  /// **'Statements'**
  String get statements;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enter_mobile_number;

  /// No description provided for @country_code.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get country_code;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @bangladesh.
  ///
  /// In en, this message translates to:
  /// **'Bangladesh'**
  String get bangladesh;

  /// No description provided for @terms_and_conditions_agreement.
  ///
  /// In en, this message translates to:
  /// **'You agree to the terms and conditions'**
  String get terms_and_conditions_agreement;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @verify_otp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verify_otp;

  /// No description provided for @invalid_otp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP'**
  String get invalid_otp;

  /// No description provided for @otp_sent.
  ///
  /// In en, this message translates to:
  /// **'OTP Sent'**
  String get otp_sent;

  /// No description provided for @phone_verification.
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get phone_verification;

  /// No description provided for @resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resend_otp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
