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
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 40),
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
    return AnimatedPadding(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20),
      duration: const Duration(milliseconds: 300),
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}
