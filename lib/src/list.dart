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
        Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My agenda', style: theme.textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child:
                        Text('These are the topics I’d like to discuss today.'),
                  ),
                  SizedBox(height: 30),
                  for (final item in agenda.items) AgendaListItem(item),
                ],
              ),
            ),
          ),
        ),
        CongratsCard(),
      ],
    );
  }
}
