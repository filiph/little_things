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
          50: Color(0xFFD1E1EF),
          100: Color(0xFFB3CDE5),
          200: Color(0xFF85AFD5),
          300: Color(0xFF679BCB),
          400: Color(0xFF4987C1),
          500: Color(0xFF386FA4),
          600: Color(0xFF386FA4),
          700: Color(0xFF2F5D89),
          800: Color(0xFF1F3E5B),
          900: Color(0xFF101F2E),
        }),
        accentColor: Color(0xFFE42535),
        splashColor: Color(0xFFD1E1EF),
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
