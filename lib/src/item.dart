import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:provider/provider.dart';

class AgendaListItem extends StatelessWidget {
  final AgendaItem item;

  const AgendaListItem(this.item);

  @override
  Widget build(BuildContext context) {
    final isDone =
        context.select<DoneNotifier, bool>((value) => value.isDone(item));

    return InkWell(
      onTap: () {
        context.read<DoneNotifier>().toggle(item);
      },
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: 20),
        duration: const Duration(milliseconds: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name, style: TextStyle(fontSize: 22)),
            Icon(Icons.check, color: isDone ? Colors.green : Colors.black12),
          ],
        ),
      ),
    );
  }
}
