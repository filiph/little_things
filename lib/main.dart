import 'package:flutter/material.dart';
import 'package:little_things_list/src/agenda.dart';
import 'package:little_things_list/src/done_provider.dart';
import 'package:yaml/yaml.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DoneNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Agenda> _agenda;

  @override
  void initState() {
    super.initState();
    _agenda = _parseAgenda(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
        ),
      ),
      home: FutureBuilder<Agenda>(
        future: _agenda,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return MyAgendaList(snapshot.data);
        },
      ),
    );
  }

  Future<Agenda> _parseAgenda(BuildContext context) async {
    final contents =
        await DefaultAssetBundle.of(context).loadString('assets/outline.yaml');
    final doc = loadYaml(contents) as YamlList;
    return Agenda([
      for (final map in doc) AgendaItem(map['name'], map['desc']),
    ]);
  }
}

class MyAgendaList extends StatelessWidget {
  final Agenda agenda;

  const MyAgendaList(this.agenda);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My agenda',
              style: TextStyle(fontSize: 24),
            ),
            for (final item in agenda.items) AgendaListItem(item),
            ElevatedButton(
              onPressed: () {},
              child: Text('Finish'),
            )
          ],
        ),
      ),
    );
  }
}

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
