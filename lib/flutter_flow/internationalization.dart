import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
  }) =>
      [enText, frText][languageIndex] ?? '';

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
  // HomePage
  {
    '7ifdehmg': {
      'en': 'French for \nTravel',
      'fr': '',
    },
    'wob5ipz0': {
      'en': 'Button',
      'fr': '',
    },
    'j3baindk': {
      'en': 'Button',
      'fr': '',
    },
    '0vq9k4uj': {
      'en': 'Common',
      'fr': '',
    },
    '063k6shf': {
      'en': 'Greetings',
      'fr': '',
    },
    'ico318bs': {
      'en': 'Assistance',
      'fr': '',
    },
    'ebcywwzl': {
      'en': 'Directions',
      'fr': '',
    },
    '1sfns2vv': {
      'en': 'Restaurant',
      'fr': '',
    },
    'q5t91gqy': {
      'en': 'Travel \nTalk',
      'fr': '',
    },
    'rfazmrtp': {
      'en': 'Common',
      'fr': '',
    },
  },
  // Common
  {
    'bpc16sgm': {
      'en': 'Thank you  (*press to translate*)',
      'fr': '',
    },
    'upwd97dv': {
      'en': 'Merci',
      'fr': '',
    },
    'dwjyc7ny': {
      'en': 'Thank you very much',
      'fr': '',
    },
    'j5de3fl6': {
      'en': 'Merci beaucoup',
      'fr': '',
    },
    '40xty20u': {
      'en': 'Yes',
      'fr': '',
    },
    '1joklhz5': {
      'en': 'Oui',
      'fr': '',
    },
    'kyvuqx0k': {
      'en': 'No',
      'fr': '',
    },
    '0ijf8to4': {
      'en': 'Non',
      'fr': '',
    },
    'bvrlyof7': {
      'en': 'Please',
      'fr': '',
    },
    '89qrsu5q': {
      'en': 'S\'il vous plaît',
      'fr': '',
    },
    'oeukkrq7': {
      'en': 'Excuse me',
      'fr': '',
    },
    'vuhkgj5o': {
      'en': 'Excusez-moi',
      'fr': '',
    },
    'awbey027': {
      'en': 'Pardon',
      'fr': '',
    },
    '6tul4msr': {
      'en': 'Pardon',
      'fr': '',
    },
    'c20whylf': {
      'en': 'You’re welcome  \n(informal “it was nothing”)',
      'fr': '',
    },
    'rki7pxvi': {
      'en': 'De rien',
      'fr': '',
    },
    'ukeci73g': {
      'en': 'Cheers! (Health!) ',
      'fr': '',
    },
    'xmeqnnxb': {
      'en': 'Santé! ',
      'fr': '',
    },
    'rzbywkke': {
      'en': '1 2 3 4 5 6 7 8 9 10',
      'fr': '',
    },
    'z23tzbyt': {
      'en':
          '1 Un,  2 Deux,  3 Troi,  4 Quatre, 5 Cinq, \n 6 Six, 7 Sept, 8 Huit,  9 Neuf, 10 Dix\n',
      'fr': '',
    },
    '6mfw29zs': {
      'en': 'Welcome',
      'fr': '',
    },
    'z5y27z2v': {
      'en': 'Bienvenue',
      'fr': '',
    },
    'qz36q77s': {
      'en': 'Button',
      'fr': '',
    },
    'xuwqm5xv': {
      'en': 'Button',
      'fr': '',
    },
    'ibc9jq6a': {
      'en': 'Button',
      'fr': '',
    },
    'oxj33gk7': {
      'en': 'Button',
      'fr': '',
    },
    '0cudw02t': {
      'en': 'Button',
      'fr': '',
    },
    '0qauugon': {
      'en': 'Button',
      'fr': '',
    },
    'b60nqnwz': {
      'en': 'Button',
      'fr': '',
    },
    '3739cj15': {
      'en': 'Button',
      'fr': '',
    },
    'uvl49wxj': {
      'en': 'Button',
      'fr': '',
    },
    'uyqjv9is': {
      'en': 'Button',
      'fr': '',
    },
    'vm5teoak': {
      'en': 'Button',
      'fr': '',
    },
    'y66wdfq0': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Greetings
  {
    's3qv51mk': {
      'en': 'Hello',
      'fr': '',
    },
    'zqp4ifl1': {
      'en': 'Bonjour',
      'fr': '',
    },
    'fpb2kq1h': {
      'en': 'Hi (informal) ',
      'fr': '',
    },
    'jgsweynr': {
      'en': 'Salut',
      'fr': '',
    },
    'zo19qb1m': {
      'en': 'Good evening',
      'fr': '',
    },
    '3mp3nhb5': {
      'en': 'Bonsoir',
      'fr': '',
    },
    'nagx4gda': {
      'en': 'Nice to meet you ',
      'fr': '',
    },
    'kquil1cn': {
      'en': 'Enchanté',
      'fr': '',
    },
    '1ed8gt8h': {
      'en': 'How are you? (formal)',
      'fr': '',
    },
    'e1nnnff8': {
      'en': 'Comment allez-vous?',
      'fr': '',
    },
    'xr1jcf9d': {
      'en': 'How’s it going? (slang)  ',
      'fr': '',
    },
    'u9wzc5wn': {
      'en': 'Ça va?',
      'fr': '',
    },
    'ifphqc58': {
      'en': 'I’m good, and you? ',
      'fr': '',
    },
    'w0cvdvu2': {
      'en': 'Ça va bien, et toi?',
      'fr': '',
    },
    'mr09fp2k': {
      'en': 'My name is _',
      'fr': '',
    },
    'ikf2uwbw': {
      'en': 'Je m\'appelle _',
      'fr': '',
    },
    'l2z088qe': {
      'en': 'What is your name?',
      'fr': '',
    },
    'x1r1dlxi': {
      'en': 'Comment vous appelez-vous?',
      'fr': '',
    },
    'my3g4mzb': {
      'en': 'Have a good day',
      'fr': '',
    },
    '60re973j': {
      'en': 'Bonne journée',
      'fr': '',
    },
    '190rz3jh': {
      'en': 'Have a good evening',
      'fr': '',
    },
    '4sx2ow1t': {
      'en': 'Bonne soirée',
      'fr': '',
    },
    'iktfo0ui': {
      'en': 'Good night ',
      'fr': '',
    },
    'zpw4dqsf': {
      'en': 'Bonne nuit',
      'fr': '',
    },
    '6exxy8g5': {
      'en': 'Goodbye',
      'fr': '',
    },
    'rp8vm50x': {
      'en': 'Au revoir',
      'fr': '',
    },
    'mydypjtg': {
      'en': 'Button',
      'fr': '',
    },
    'hxmdv31z': {
      'en': 'Button',
      'fr': '',
    },
    'cix5pezt': {
      'en': 'Button',
      'fr': '',
    },
    'fzb15tbf': {
      'en': 'Button',
      'fr': '',
    },
    'am8amjb5': {
      'en': 'Button',
      'fr': '',
    },
    's9thf3u1': {
      'en': 'Button',
      'fr': '',
    },
    'h5wq42m0': {
      'en': 'Button',
      'fr': '',
    },
    '11kgzk6k': {
      'en': 'Button',
      'fr': '',
    },
    'aenxhnid': {
      'en': 'Button',
      'fr': '',
    },
    'ed26zfzz': {
      'en': 'Button',
      'fr': '',
    },
    '11c2tatu': {
      'en': 'Button',
      'fr': '',
    },
    'enggvykb': {
      'en': 'Button',
      'fr': '',
    },
    'fh21ar4a': {
      'en': 'Button',
      'fr': '',
    },
    'mvb62m05': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Assistance
  {
    'ozqsvs0g': {
      'en': 'I don’t speak French',
      'fr': '',
    },
    'wwh9x0yy': {
      'en': 'Je ne parle pas français',
      'fr': '',
    },
    'juhk1qs0': {
      'en': 'I don’t understand',
      'fr': '',
    },
    'zjo2ijlh': {
      'en': 'Je ne comprends pas',
      'fr': '',
    },
    'ss0lfecx': {
      'en': 'Do you speak English? ',
      'fr': '',
    },
    '2igmlo5o': {
      'en': 'Parlez-vous anglais?',
      'fr': '',
    },
    'r34byxw6': {
      'en': 'Could you help me, please?',
      'fr': '',
    },
    'g5py8h62': {
      'en': 'Pourriez-vous m’aider, s\'il vous plaît?',
      'fr': '',
    },
    'vdbroqln': {
      'en': 'I don’t know',
      'fr': '',
    },
    'q7zno0a9': {
      'en': 'Je ne sais pas',
      'fr': '',
    },
    'y6l496gr': {
      'en': 'I am sorry',
      'fr': '',
    },
    'mn48hgxa': {
      'en': 'je suis désolé',
      'fr': '',
    },
    'h0y0zmc1': {
      'en': 'Button',
      'fr': '',
    },
    'zxj0lmap': {
      'en': 'Button',
      'fr': '',
    },
    'jtwke2x7': {
      'en': 'Button',
      'fr': '',
    },
    'lkhl3cfe': {
      'en': 'Button',
      'fr': '',
    },
    'k8kvnyt9': {
      'en': 'Button',
      'fr': '',
    },
    'oi7thsjr': {
      'en': 'Button',
      'fr': '',
    },
    '0jji3uyf': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Directions
  {
    'p7zidl13': {
      'en': 'Where is _ ?',
      'fr': '',
    },
    'fyv1ndro': {
      'en': 'Où est _ ?',
      'fr': '',
    },
    'jpxdrwoj': {
      'en': 'Where is the exit?',
      'fr': '',
    },
    'h4tsq6ds': {
      'en': 'Où est la sortie?',
      'fr': '',
    },
    'u9pan3p0': {
      'en': 'Where is the metro? (subway)',
      'fr': '',
    },
    's49o6u8n': {
      'en': 'Où est le métro?',
      'fr': '',
    },
    'q3l751ud': {
      'en': 'Where is the train station?',
      'fr': '',
    },
    'nxco37ri': {
      'en': 'Où est la gare?',
      'fr': '',
    },
    '44a0v0a6': {
      'en': 'Where is the taxi?',
      'fr': '',
    },
    '5luyhbkb': {
      'en': 'Où est le taxi?',
      'fr': '',
    },
    '1ei2rzyg': {
      'en': 'Where is the bus?',
      'fr': '',
    },
    'okhkkrqc': {
      'en': 'Où est le bus?',
      'fr': '',
    },
    'wngi2zwr': {
      'en': 'Where is the Airport?',
      'fr': '',
    },
    'uer142ay': {
      'en': 'où est l\'aéroport?',
      'fr': '',
    },
    'pcfrs46d': {
      'en': 'Where is the ticket window?',
      'fr': '',
    },
    'tbpdqoa2': {
      'en': 'Où est le guichet?',
      'fr': '',
    },
    '6umq07cl': {
      'en': 'Where are the toilets?',
      'fr': '',
    },
    'pefhkwp1': {
      'en': 'Où sont les toilettes?',
      'fr': '',
    },
    '71p148eb': {
      'en': 'Button',
      'fr': '',
    },
    'u2x9j7jk': {
      'en': 'Button',
      'fr': '',
    },
    'snuztvbq': {
      'en': 'Button',
      'fr': '',
    },
    'iqiq5hfb': {
      'en': 'Button',
      'fr': '',
    },
    'hspvyl54': {
      'en': 'Button',
      'fr': '',
    },
    'uhnp31er': {
      'en': 'Button',
      'fr': '',
    },
    '7ail3plp': {
      'en': 'Button',
      'fr': '',
    },
    'of40hkg4': {
      'en': 'Button',
      'fr': '',
    },
    '8g17n45h': {
      'en': 'Button',
      'fr': '',
    },
    'n4nugur5': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Restraurant
  {
    'e077jtfy': {
      'en': 'How much is it?',
      'fr': '',
    },
    'wh5hqao7': {
      'en': 'C’est combien?',
      'fr': '',
    },
    'iydf78up': {
      'en': 'A table for two, please',
      'fr': '',
    },
    '5c6cf0vm': {
      'en': 'Une table pour deux, s’il vous plaît',
      'fr': '',
    },
    '3hsboyks': {
      'en': 'The menu, please',
      'fr': '',
    },
    'bcti3n6h': {
      'en': 'La carte, s’il vous plaît',
      'fr': '',
    },
    'm2glebxt': {
      'en': 'The wine menu, please',
      'fr': '',
    },
    'omlwx5bc': {
      'en': 'La carte des vins, s’il vous plaît',
      'fr': '',
    },
    '8blmyxmq': {
      'en': 'I would like _ ',
      'fr': '',
    },
    'c72we949': {
      'en': 'Je voudrais _ ',
      'fr': '',
    },
    '1h5v76fn': {
      'en': 'A coffee with milk',
      'fr': '',
    },
    'zai40man': {
      'en': 'un café au lait',
      'fr': '',
    },
    'ewqbstw4': {
      'en': 'Some water',
      'fr': '',
    },
    'hlryq4wm': {
      'en': 'De l\'eau',
      'fr': '',
    },
    '0lz2rm8r': {
      'en': 'A carafe of water',
      'fr': '',
    },
    'iktj0cbt': {
      'en': 'Une carafe d\'eau',
      'fr': '',
    },
    'flxzlkvx': {
      'en': 'A beer',
      'fr': '',
    },
    'xvrf9yfo': {
      'en': 'Une bière',
      'fr': '',
    },
    '5sxh3k88': {
      'en': 'A glass of red wine',
      'fr': '',
    },
    'iipevc0j': {
      'en': 'Un verre de vin rouge',
      'fr': '',
    },
    'wln3fuoj': {
      'en': 'A glass of white wine',
      'fr': '',
    },
    'j436n8vk': {
      'en': 'Un verre de vin blanc',
      'fr': '',
    },
    'otr1qkmi': {
      'en': 'The bill, please',
      'fr': '',
    },
    '048j6evv': {
      'en': 'L’addition, s’il vous plaît',
      'fr': '',
    },
    's3lueazi': {
      'en': 'Very good',
      'fr': '',
    },
    'nrisy3s2': {
      'en': 'Très bien',
      'fr': '',
    },
    'elo8cijo': {
      'en': 'Button',
      'fr': '',
    },
    '689ubrvq': {
      'en': 'Button',
      'fr': '',
    },
    '3tfd4vx2': {
      'en': 'Button',
      'fr': '',
    },
    'w1g9t8h7': {
      'en': 'Button',
      'fr': '',
    },
    '99ry1tgg': {
      'en': 'Button',
      'fr': '',
    },
    '12js77e7': {
      'en': 'Button',
      'fr': '',
    },
    '3qzsgi29': {
      'en': 'Button',
      'fr': '',
    },
    'wqxzl5ta': {
      'en': 'Button',
      'fr': '',
    },
    'uekljleb': {
      'en': 'Button',
      'fr': '',
    },
    'v08j3tml': {
      'en': 'Button',
      'fr': '',
    },
    'zqximl26': {
      'en': 'Button',
      'fr': '',
    },
    'd6ufudy5': {
      'en': 'Button',
      'fr': '',
    },
    'oa2k3475': {
      'en': 'Button',
      'fr': '',
    },
    '7xedm335': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '6009t13m': {
      'en': '',
      'fr': '',
    },
    'je78hpkk': {
      'en': '',
      'fr': '',
    },
    'du7ligiv': {
      'en': '',
      'fr': '',
    },
    'i622w4u1': {
      'en': '',
      'fr': '',
    },
    'a3jqormg': {
      'en': '',
      'fr': '',
    },
    '2xo582sx': {
      'en': '',
      'fr': '',
    },
    'kj7a6skv': {
      'en': '',
      'fr': '',
    },
    'svyvrq3c': {
      'en': '',
      'fr': '',
    },
    'e3opthv7': {
      'en': '',
      'fr': '',
    },
    'bb7pt24l': {
      'en': '',
      'fr': '',
    },
    'ld86axml': {
      'en': '',
      'fr': '',
    },
    '9dogq6as': {
      'en': '',
      'fr': '',
    },
    'piuvpjpc': {
      'en': '',
      'fr': '',
    },
    'gzlen8d1': {
      'en': '',
      'fr': '',
    },
    'hxs7xaop': {
      'en': '',
      'fr': '',
    },
    'fhy1vz3h': {
      'en': '',
      'fr': '',
    },
    '7p7d09cg': {
      'en': '',
      'fr': '',
    },
    '1jcq18m7': {
      'en': '',
      'fr': '',
    },
    'rjogy1j0': {
      'en': '',
      'fr': '',
    },
    'xh0ar0bg': {
      'en': '',
      'fr': '',
    },
    '2y0zw1vp': {
      'en': '',
      'fr': '',
    },
    'ggzlxt5c': {
      'en': '',
      'fr': '',
    },
    '9blgl7vw': {
      'en': '',
      'fr': '',
    },
    'x4bwhl5j': {
      'en': '',
      'fr': '',
    },
    't5ws2faa': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
