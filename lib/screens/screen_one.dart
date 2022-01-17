import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:localization/provider/change_language_notifire.dart';
class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.screenOneAppBar),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/LoginScreen');
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Card(
           child: ListTile(
             title: Text(AppLocalizations.of(context)!.name),
             subtitle: Text('amermadawood@gmail.com'),
             leading: Icon(Icons.person),
             trailing: IconButton(
               onPressed: (){},
               icon: Icon(Icons.email),
             ),
           ),
          ),
          SizedBox(height: 30,),
          Container(
            width: 360,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.description,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
