import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:localization/provider/change_language_notifire.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.appBarTitle
          ,style: TextStyle(color: Colors.blueAccent,fontSize: 24,fontWeight:FontWeight.bold),),
        backgroundColor: Colors.white,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Locale currentLanguage =Localizations.localeOf(context);
          // String newLocal=  currentLanguage.languageCode=='en'?'ar':'en';
          String newLocal =
              Provider.of<ChangeLanguageNotifier>(context, listen: false)
                          .languageCode =='en'? 'ar': 'en';
          Provider.of<ChangeLanguageNotifier>(context, listen: false)
              .changeLanguage(languageCode: newLocal);
        },
        child: Icon(Icons.language,color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)!.login_hint,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
              SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/screen_one');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.login,
                  ),
                ),
                Spacer(),
                Text(
                  AppLocalizations.of(context)!.forget,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
