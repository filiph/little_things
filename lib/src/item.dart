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
      onLongPress: () {
        Scaffold.of(context).showBottomSheet((context) => BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Text(item.description);
            }));
      },
      child: Row(
        children: [
          Text(item.name),
          Icon(Icons.check, color: isDone ? Colors.green : Colors.black12),
        ],
      ),
    );
  }
}
