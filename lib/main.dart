import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/prefs/app_settings_prefs.dart';
import 'package:localization/provider/change_language_notifire.dart';
import 'package:localization/screens/launch_screen.dart';
import 'package:localization/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:localization/screens/screen_one.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsPreferances().initPreferances();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeLanguageNotifier>(
            create: (_) => ChangeLanguageNotifier()),
      ],
      child: MainMatiralApp(),
    );
  }
}





class MainMatiralApp extends StatelessWidget {
  const MainMatiralApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,

      //or

      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //
      // ],

      supportedLocales: AppLocalizations.supportedLocales,

      // or

      // supportedLocales:[
      // هنا هيختار لغه الجهاز واذا لغه الحهاز غير موجوده هيتم اختيار اول لغه
      //   Locale('ar'),
      //   Locale('en'),
      // ],
      //لاجباره اعطاءه لغه معينه
      //locale: Locale('ar'),

      locale: Locale(Provider.of<ChangeLanguageNotifier>(context).languageCode),

      initialRoute: '/screen_one',
      routes: {
        '/LaunchScreen': (context) => LaunchScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/screen_one': (context) => ScreenOne(),

      },
    );
  }
}
