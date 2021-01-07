import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';
import 'package:little_things_list/src/item.dart';

class MyAgendaList extends StatelessWidget {
  final Agenda agenda;

  const MyAgendaList(this.agenda);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My agenda', style: TextStyle(fontSize: 28)),
              Text("These are the topics I’d like to discuss today."),
              for (final item in agenda.items) AgendaListItem(item),
              ElevatedButton(onPressed: null, child: Text('Finish'))
            ],
          ),
        ),
      ),
    );
  }
}
