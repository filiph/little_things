import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/agenda.dart';

class Loader extends StatefulWidget {
  final Future<Agenda> Function() loadFunction;

  final Widget Function(Agenda data) builder;

  const Loader(this.loadFunction, this.builder);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState<T> extends State<Loader> {
  Future<Agenda> _future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Agenda>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return widget.builder(snapshot.data);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _future = widget.loadFunction();
  }
}
