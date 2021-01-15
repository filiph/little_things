import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:little_things_list/src/data/loader.dart';
import 'package:little_things_list/src/data/parse_agenda.dart';
import 'package:little_things_list/src/list.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(ChangeNotifierProvider(
    create: (_) => DoneNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline4: GoogleFonts.workSans(
              fontSize: 41,
              fontWeight: FontWeight.w400,
              letterSpacing: -3,
              color: Colors.black,
            ),
            headline6: GoogleFonts.workSans(fontSize: 22),
            bodyText2: GoogleFonts.sourceSerifPro(fontSize: 18, height: 1.6),
            subtitle1: GoogleFonts.sourceSerifPro(fontSize: 18, height: 1.4),
          )),
      home: Loader(
        () => parseAgenda(context),
        (agenda) => MyAgendaList(agenda),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
