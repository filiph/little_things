import 'package:flutter/material.dart';
import 'package:little_things_list/src/congrats.dart';
import 'package:little_things_list/src/data/agenda.dart';
import 'package:little_things_list/src/item.dart';

class MyAgendaList extends StatelessWidget {
  final Agenda agenda;

  const MyAgendaList(this.agenda);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF96E3FF),
                Color(0xFF9EECFF),
                Color(0xFF9FEBFF),
                Color(0xFF9FEEFF),
                Color(0xFF9FECFF),
              ],
            ),
            image: DecorationImage(
              image: AssetImage('assets/meditation.jpg'),
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 80, right: 80, bottom: 180),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text('My agenda', style: theme.textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'These are the topics I’d like to discuss today.',
                        style: theme.textTheme.subtitle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Divider(
                        thickness: 2,
                        color: theme.accentColor,
                      ),
                    ),
                    for (final item in agenda.items) AgendaListItem(item),
                  ],
                ),
              ),
            ),
          ),
        ),
        CongratsCard(),
      ],
    );
  }
}
