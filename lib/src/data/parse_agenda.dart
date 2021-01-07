import 'package:flutter/widgets.dart';
import 'package:little_things_list/src/data/agenda.dart';
import 'package:yaml/yaml.dart';

Future<Agenda> parseAgenda(BuildContext context) async {
  final contents =
      await DefaultAssetBundle.of(context).loadString('assets/outline.yaml');
  final doc = loadYaml(contents) as YamlList;
  return Agenda([
    for (final map in doc) AgendaItem(map['name'], map['desc']),
  ]);
}
