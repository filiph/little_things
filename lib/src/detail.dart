import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';

class ItemDetail extends StatelessWidget {
  final AgendaItem item;

  const ItemDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6:
              Theme.of(context).textTheme.headline6.apply(color: Colors.blue),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: [
          for (var paragraph in item.description
              .split('\n')
              .where((element) => element.isNotEmpty))
            _Paragraph(paragraph)
        ],
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;

  _Paragraph(this.text) : assert(text.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget child;
    if (text.startsWith('# ')) {
      child = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(text.substring(2), style: theme.textTheme.headline6),
      );
    } else {
      child = Text(text);
    }

    return AnimatedPadding(
      padding: EdgeInsets.only(left: 72, top: 20, right: 20),
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
