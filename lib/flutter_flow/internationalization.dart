import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'af', 'de', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? afText = '',
    String? deText = '',
    String? esText = '',
  }) =>
      [enText, frText, afText, deText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen01
  {
    'igtnyg5y': {
      'en': 'Welcome ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mzon9ydq': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // loginPage
  {
    '4zdz19ce': {
      'en': 'ShoppinFun',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vjg20178': {
      'en': 'Get Started',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1t05plbv': {
      'en': 'Shop with fun!',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lpctavr3': {
      'en': 'Email',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jagbsu9r': {
      'en': 'Password',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '121dp8qd': {
      'en': 'Remember me ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'onzaot5r': {
      'en': 'Forgot password',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oz0u4ajc': {
      'en': 'Log in',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u1qu1szr': {
      'en': 'Or log in with',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'she7e098': {
      'en': 'Don\'t have an account?  ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jaqjt8f3': {
      'en': 'Sign Up here',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oijhwjmb': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // createAccount
  {
    '7se2egn3': {
      'en': 'ShoppinFun',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9e4jyw88': {
      'en': 'Get Started',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    't2r2wc38': {
      'en': 'Shop with fun!',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'bus9vwjz': {
      'en': 'Name',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'erf0wq5o': {
      'en': 'Email',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    't30m4sc3': {
      'en': 'Password',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ysbgtg8h': {
      'en': 'Phone Number',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'g0xofbou': {
      'en': 'Remember me ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f9vbodx4': {
      'en': 'Create account',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fskk7e5a': {
      'en': 'Or create with',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'b4fn6ffh': {
      'en': 'Have an account?  ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5bvgvii7': {
      'en': 'Sign in',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wflah18n': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // welcomePage
  {
    'gdxpai27': {
      'en': 'Search all articles...',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'h4m4lw8o': {
      'en': 'Categories',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cfur4d94': {
      'en': 'Home & Office',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    's7se74n8': {
      'en': 'Appliances',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u6aasivv': {
      'en': 'Health & Beauty',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7wk0ag6h': {
      'en': 'Phones & Tablets',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hw6gdds0': {
      'en': 'Computing',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rrbdrva4': {
      'en': 'Electronics',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'l5tswnte': {
      'en': 'Fashion',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'kg1wyswo': {
      'en': 'Gaming',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4f34fwof': {
      'en': 'Sports',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q89j3xdm': {
      'en': 'Groceries',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'bau6fkw6': {
      'en': 'Cars',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'emqsgk3w': {
      'en': 'Other categories',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jjupkmz0': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // favorites
  {
    'my1avhvn': {
      'en': 'Favorites',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'np7u6usw': {
      'en': 'favorites',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // passwordRecovery
  {
    'vsoeebed': {
      'en': 'Back',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'z7u4rboa': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mn83fztp': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'a2dc4dp7': {
      'en': 'Enter your email...',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6ucmfqrn': {
      'en': 'Send Link',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'e70ub1hb': {
      'en': 'forgot password',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1ws5ewkb': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // verificationPage
  {
    'ekcazjfw': {
      'en': 'OTP Verification',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wdvhoch2': {
      'en': 'OTP Code',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '790m3nq5': {
      'en': 'VERIFY',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'myfuwtx7': {
      'en': 'Resend code in',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tpk3nprw': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Settings
  {
    '91uc12jn': {
      'en': 'Account',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pz4z3tn0': {
      'en': 'Edit Profile',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2jrznuhk': {
      'en': 'Language',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x8b7tlxe': {
      'en': 'Change Password',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dgbbxc3f': {
      'en': 'Address',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xjnsqef5': {
      'en': 'Payment Options',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1joy3w8h': {
      'en': 'Country',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8fccvnjc': {
      'en': 'Notification Settings',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'gpq4dphk': {
      'en': 'Notification Settings',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q91cqrrp': {
      'en': 'General',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'unr7cvxg': {
      'en': 'Support',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'iq4gyvcc': {
      'en': 'Logout',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xom4ijdk': {
      'en': 'Terms of Service',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0sy83o6w': {
      'en': 'Invite Friends',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qne592at': {
      'en': 'Profile',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pe6llh1e': {
      'en': 'Settings',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // sellersPage
  {
    'wtzb9s3z': {
      'en': 'Page Title',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5cm7ipbm': {
      'en': 'Sell',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Cart
  {
    '60c2elh9': {
      'en': 'Your Cart',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f9tx1rai': {
      'en': 'Size: ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wmauf6hx': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'h8bkadm5': {
      'en': 'Remove',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zn7lzbln': {
      'en': 'Order Summary',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9or74r7i': {
      'en': 'Below is a list of your items.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ieg4vni6': {
      'en': 'Price Breakdown',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '182dr3o9': {
      'en': 'Base Price',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x7yu2wlk': {
      'en': 'Total',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8nyih1h2': {
      'en': 'Continue to Checkout',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mkv70x5b': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // detailedPage
  {
    '0jk9277l': {
      'en': ' ',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7q7iz4lk': {
      'en': '39',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6l11qzof': {
      'en': '40',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rr5lxawj': {
      'en': '41',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mloreh3v': {
      'en': '42',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '81dur7il': {
      'en': '43',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zykszhfe': {
      'en': 'Select a Size',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'y4be05ix': {
      'en': 'Add to Cart',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'j46xumga': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // supportPage
  {
    '2p09e87i': {
      'en': 'Welcome to support',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'knetbo6i': {
      'en': 'How can we help you?',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'iasx1mg6': {
      'en': 'Call Us',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dxrvr9x2': {
      'en': 'Email Us',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ebgd3phk': {
      'en': 'Search FAQs',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ix40zu0h': {
      'en': 'Review FAQ\'s below',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dihm68ef': {
      'en': 'How do I download Code?',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qr9vd5qo': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '43s04kie': {
      'en': 'How do I download Code?',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1wcn2qn7': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9lm0jro1': {
      'en': 'How do I download Code?',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qrd103e3': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'maecf5g4': {
      'en': 'Create Ticket',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'uqidlhsd': {
      'en': 'Chat Now',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qukezukc': {
      'en': 'Get support',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ur5orci3': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // phoneNumberVerification
  {
    'uvcgivqk': {
      'en': 'SMS Verification',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    's9k3ub6d': {
      'en': 'SMS Code',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'k3u4n514': {
      'en': 'VERIFY',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qki163b0': {
      'en': 'Resend code in',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oo7pe3br': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // fashionPage
  {
    'hd9b1d5s': {
      'en': 'Items that are getting attention',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'izg019h2': {
      'en': 'Find the latest look in our recent review.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '63fz4m6w': {
      'en': 'Nike Air Shoe',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'c8s104oz': {
      'en': '\$120',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5ftp9oup': {
      'en': 'AirMax',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'k59vwpzm': {
      'en': '\$250.00',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xp6596u9': {
      'en': 'Popular Looks',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'whdv31q6': {
      'en': 'Shop',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Success1Payment
  {
    'au7owmuy': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // profile
  {
    'nuikmy4h': {
      'en': 'Randy Alcorn',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    't8v492v6': {
      'en': '240 Sales',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jxpkspv4': {
      'en': 'San Antonio, Tx.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '65mhgp3n': {
      'en': 'Randy Alcorn',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0quhbwly': {
      'en': '240 Sales',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'of44oeiu': {
      'en': 'San Antonio, Tx.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'm6bhquzm': {
      'en': 'My Items',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ppx5h2wa': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2ed1z5d9': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tdzpo8ie': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jmpcjmcr': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cqucz31d': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '94mm1o1x': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lp5r8fg5': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'c4g8szbw': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wj2na6y0': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ft99dtn3': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '49coa703': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xg3fjm00': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5egtko4y': {
      'en': 'Sold Items',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p6myhhb6': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zyfzij1p': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fh98rnya': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rrk3fbab': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rp9xjpzo': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vmjwx3ho': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wlrxiwek': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nz7vsz6l': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'madenqf8': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '46rdtm9v': {
      'en': 'Vitsoe 1982',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qeohiu1b': {
      'en': 'Ordered on Feb 15, 2022',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'g99ht9wo': {
      'en': '\$126.20',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '479bb80f': {
      'en': 'Reviews',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qshlo31b': {
      'en': 'UserName',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '85a0iljx': {
      'en': 'user@domainname.com',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1u3c9x1o': {
      'en': 'Overall',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fbku2cot': {
      'en': '5',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'aypcqahy': {
      'en':
          '"These sports shoes are incredibly comfortable, lightweight, and provide excellent support for my feet during workouts and runs. I\'ve noticed a significant improvement in my performance since wearing them!"',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'gdvf465k': {
      'en': 'UserName',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'bt0bhxg6': {
      'en': 'user@domainname.com',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'n3sbbucu': {
      'en': 'Overall',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9yegbhif': {
      'en': '5',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yztscy1a': {
      'en':
          '"These sports shoes are incredibly comfortable, lightweight, and provide excellent support for my feet during workouts and runs. I\'ve noticed a significant improvement in my performance since wearing them!"',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8fhs59qh': {
      'en': 'Profile',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mpgx8cf2': {
      'en': 'Home',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // deliveryAddress
  {
    'g8q309mb': {
      'en': 'Delivery Address',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8i0brojk': {
      'en': 'Address',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f15f2a45': {
      'en': 'Enter your delivery address',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3rrq5oo6': {
      'en': 'City',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f49y1i60': {
      'en': 'Enter your city',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ma5zcq75': {
      'en': 'State',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oa3igy48': {
      'en': 'Enter your state',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hx3dy5p7': {
      'en': 'Postal Code',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fs97brlp': {
      'en': 'Enter your postal code',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fv5dskvt': {
      'en': 'Save Address',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // emailCheck
  {
    'i8xijogl': {
      'en': 'Check your Email',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pbu11kpb': {
      'en': 'We have sent a password Recovery code to your Email',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MyCart
  {
    'kn9yxlh1': {
      'en': 'Contact Inofrmation',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // success
  {
    '6hqbjkj4': {
      'en': 'Payment Confirmed!',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7y3f93ud': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xy1tk5ol': {
      'en': 'Mastercard Ending in 4021',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f8un98kt': {
      'en': 'Back To Shopping',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'p0qbl6a6': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pbc18677': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '02njbrm6': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pxwn3k3c': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ia87rsle': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oh72fknb': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fnn5bmai': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p2c38pqc': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'kj618a8p': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5kornu9h': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fbd9pmsw': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mpb2vdc8': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'sjqymea1': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rxi2vxri': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'sjnj00wm': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1azhf8kq': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7zvm2f1s': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'b54mbexa': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pt1ubv1k': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q30hbp0l': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    's20ekm2w': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    't8qna4u5': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yh84dqgy': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nmogxa7r': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ui6ymm7m': {
      'en': '',
      'af': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
