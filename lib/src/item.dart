import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:little_things_list/src/detail.dart';
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
    const double vertical = 7;
    const paddingDuration = Duration(milliseconds: 300);

    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ItemDetail(item)));
            },
            child: AnimatedPadding(
              padding:
                  EdgeInsets.only(left: left, top: vertical, bottom: vertical),
              duration: paddingDuration,
              child: Text(item.name, style: theme.textTheme.headline6),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<DoneNotifier>().toggle(item);
          },
          child: AnimatedPadding(
            padding: const EdgeInsets.only(
                left: 20, right: right, top: vertical, bottom: vertical),
            duration: paddingDuration,
            child: Icon(Icons.check, size: 28,
                color: isDone ? theme.primaryColor : theme.primaryColorLight),
          ),
        ),
      ],
    );
  }
}
