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

    const double left = 20;
    const double right = 20;
    const double vertical = 0;
    const paddingDuration = Duration(milliseconds: 300);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: AnimatedPadding(
              padding:
                  EdgeInsets.only(left: left, top: vertical, bottom: vertical),
              duration: paddingDuration,
              child: Text(item.name, style: TextStyle(fontSize: 22)),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<DoneNotifier>().toggle(item);
          },
          child: AnimatedPadding(
            padding: const EdgeInsets.only(
                left: right, right: right, top: vertical, bottom: vertical),
            duration: paddingDuration,
            child: Icon(Icons.check,
                color: isDone ? Colors.green : Colors.black12),
          ),
        ),
      ],
    );
  }
}
