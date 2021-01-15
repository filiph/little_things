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
        primarySwatch: MaterialColor(0xFF386FA4, {
          50: Color(0xFF9AE7FF),
          100: Color(0xFF37DBFF),
          200: Color(0xFF01C9FF),
          300: Color(0xFF1C8CFC),
          400: Color(0xFF0E48A4),
          500: Color(0xFF005CB0),
          600: Color(0xFF004A8B),
          700: Color(0xFF003666),
          800: Color(0xFF00213D),
          900: Color(0xFF001629),
        }),
        accentColor: Color(0xFFF0B600),
        splashColor: Color(0xFF9AE7FF),
        canvasColor: Color(0xFF9FECFF),
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
        ),
      ),
      home: Loader(
        () => parseAgenda(context),
        (agenda) => MyAgendaList(agenda),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
