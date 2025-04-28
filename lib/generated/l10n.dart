// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mawhibty`
  String get appTitle {
    return Intl.message('Mawhibty', name: 'appTitle', desc: '', args: []);
  }

  /// `Your Sports Journey Starts Here!`
  String get onboardingTitle1 {
    return Intl.message(
      'Your Sports Journey Starts Here!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Whether you're a rising star or a club looking for talent, our platform opens the doors. Ready to chase your dream?`
  String get onboardingDesc1 {
    return Intl.message(
      'Whether you\'re a rising star or a club looking for talent, our platform opens the doors. Ready to chase your dream?',
      name: 'onboardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Show Your Skills... or Discover Them!`
  String get onboardingTitle2 {
    return Intl.message(
      'Show Your Skills... or Discover Them!',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Upload your skills or set your team's needs — we'll handle the rest. We're here to get you to the next level.`
  String get onboardingDesc2 {
    return Intl.message(
      'Upload your skills or set your team\'s needs — we\'ll handle the rest. We\'re here to get you to the next level.',
      name: 'onboardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Every Step Takes You Closer to Greatness!`
  String get onboardingTitle3 {
    return Intl.message(
      'Every Step Takes You Closer to Greatness!',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `With every challenge or request, your chances to shine grow. Let’s take the journey together!`
  String get onboardingDesc3 {
    return Intl.message(
      'With every challenge or request, your chances to shine grow. Let’s take the journey together!',
      name: 'onboardingDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Login`
  String get login_screen_title {
    return Intl.message(
      'Login',
      name: 'login_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! Let's begin your tour.`
  String get login_screen_welcome {
    return Intl.message(
      'Welcome! Let\'s begin your tour.',
      name: 'login_screen_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get login_screen_email_hint {
    return Intl.message(
      'Email address',
      name: 'login_screen_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_screen_password_hint {
    return Intl.message(
      'Password',
      name: 'login_screen_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_screen_forget_password {
    return Intl.message(
      'Forgot password?',
      name: 'login_screen_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_screen_create_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_screen_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get login_screen_create_account_button {
    return Intl.message(
      'Create an account',
      name: 'login_screen_create_account_button',
      desc: '',
      args: [],
    );
  }

  /// `Let's Go!`
  String get login_screen_login_button {
    return Intl.message(
      'Let\'s Go!',
      name: 'login_screen_login_button',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forget_password_screen_title {
    return Intl.message(
      'Forgot Password?',
      name: 'forget_password_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `No worries, we’ll get your account back in seconds!`
  String get forget_password_screen_instruction {
    return Intl.message(
      'No worries, we’ll get your account back in seconds!',
      name: 'forget_password_screen_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Enter email or phone number`
  String get forget_password_screen_email_hint {
    return Intl.message(
      'Enter email or phone number',
      name: 'forget_password_screen_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get forget_password_screen_send_code_button {
    return Intl.message(
      'Send Code',
      name: 'forget_password_screen_send_code_button',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get otp_screen_title {
    return Intl.message(
      'Verify OTP',
      name: 'otp_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Check your message and enter the code!`
  String get otp_screen_instruction {
    return Intl.message(
      'Check your message and enter the code!',
      name: 'otp_screen_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get otp_screen_resend_button {
    return Intl.message(
      'Resend',
      name: 'otp_screen_resend_button',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get otp_screen_didnot_receive_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'otp_screen_didnot_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get otp_button {
    return Intl.message('Verify', name: 'otp_button', desc: '', args: []);
  }

  /// `New Password`
  String get new_password_screen_title {
    return Intl.message(
      'New Password',
      name: 'new_password_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `New password? Keep it safe this time`
  String get new_password_screen_instruction {
    return Intl.message(
      'New password? Keep it safe this time',
      name: 'new_password_screen_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get new_password_screen_password_hint {
    return Intl.message(
      'Password',
      name: 'new_password_screen_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get new_password_screen_confirm_password_hint {
    return Intl.message(
      'Confirm Password',
      name: 'new_password_screen_confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter the App!`
  String get new_password_screen_update_button {
    return Intl.message(
      'Enter the App!',
      name: 'new_password_screen_update_button',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email.`
  String get email_required {
    return Intl.message(
      'Please enter your email.',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email or phone number.`
  String get forget_password_email_required {
    return Intl.message(
      'Please enter your email or phone number.',
      name: 'forget_password_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get email_invalid {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address or phone number.`
  String get forget_password_email_invalid {
    return Intl.message(
      'Please enter a valid email address or phone number.',
      name: 'forget_password_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password.`
  String get password_required {
    return Intl.message(
      'Please enter your password.',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get password_short {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'password_short',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get password_mismatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get name_required {
    return Intl.message(
      'Please enter your name',
      name: 'name_required',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters long.`
  String get name_short {
    return Intl.message(
      'Name must be at least 3 characters long.',
      name: 'name_short',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP.`
  String get otp_required {
    return Intl.message(
      'Please enter the OTP.',
      name: 'otp_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid OTP.`
  String get otp_invalid {
    return Intl.message(
      'Please enter a valid OTP.',
      name: 'otp_invalid',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent successfully.`
  String get otp_sent {
    return Intl.message(
      'OTP sent successfully.',
      name: 'otp_sent',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the full code.`
  String get otp_not_complete {
    return Intl.message(
      'Please enter the full code.',
      name: 'otp_not_complete',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get register_screen_title {
    return Intl.message(
      'Create Account',
      name: 'register_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Ready to start your football journey? Sign up and show us your skills!`
  String get register_screen_welcome {
    return Intl.message(
      'Ready to start your football journey? Sign up and show us your skills!',
      name: 'register_screen_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get register_screen_name_hint {
    return Intl.message(
      'Name',
      name: 'register_screen_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_screen_email_hint {
    return Intl.message(
      'Email',
      name: 'register_screen_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_screen_password_hint {
    return Intl.message(
      'Password',
      name: 'register_screen_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get register_screen_confirm_password_hint {
    return Intl.message(
      'Confirm Password',
      name: 'register_screen_confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Let's continue!`
  String get register_screen_register_button {
    return Intl.message(
      'Let\'s continue!',
      name: 'register_screen_register_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get register_screen_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'register_screen_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get register_screen_login_button {
    return Intl.message(
      'Login',
      name: 'register_screen_login_button',
      desc: '',
      args: [],
    );
  }

  /// `Complete Your Profile`
  String get completeProfile {
    return Intl.message(
      'Complete Your Profile',
      name: 'completeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Let's get you familiar with the stadiums!`
  String get welcomeToStadiums {
    return Intl.message(
      'Let\'s get you familiar with the stadiums!',
      name: 'welcomeToStadiums',
      desc: '',
      args: [],
    );
  }

  /// `Your Birth Date`
  String get birthDate {
    return Intl.message(
      'Your Birth Date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Your Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Gender`
  String get chooseGender {
    return Intl.message(
      'Choose Your Gender',
      name: 'chooseGender',
      desc: '',
      args: [],
    );
  }

  /// `What sport do you play?`
  String get chooseSport {
    return Intl.message(
      'What sport do you play?',
      name: 'chooseSport',
      desc: '',
      args: [],
    );
  }

  /// `What's your position?`
  String get choosePosition {
    return Intl.message(
      'What\'s your position?',
      name: 'choosePosition',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up & Start Your Journey!`
  String get registerAndStartJourney {
    return Intl.message(
      'Sign Up & Start Your Journey!',
      name: 'registerAndStartJourney',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your birth date.`
  String get birthDateRequired {
    return Intl.message(
      'Please enter your birth date.',
      name: 'birthDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date. Please choose a valid date.`
  String get birthDateInvalid {
    return Intl.message(
      'Invalid date. Please choose a valid date.',
      name: 'birthDateInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The date must be in the past.`
  String get birthDateFuture {
    return Intl.message(
      'The date must be in the past.',
      name: 'birthDateFuture',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number.`
  String get phoneNumberRequired {
    return Intl.message(
      'Please enter your phone number.',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number. Please enter a valid phone number.`
  String get phoneNumberInvalid {
    return Intl.message(
      'Invalid phone number. Please enter a valid phone number.',
      name: 'phoneNumberInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please select your gender.`
  String get genderRequired {
    return Intl.message(
      'Please select your gender.',
      name: 'genderRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select a sport.`
  String get sportRequired {
    return Intl.message(
      'Please select a sport.',
      name: 'sportRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select your position.`
  String get positionRequired {
    return Intl.message(
      'Please select your position.',
      name: 'positionRequired',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
