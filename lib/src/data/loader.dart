import 'package:flutter/material.dart';

class Loader<T> extends StatefulWidget {
  final Future<T> Function() loadFunction;

  final Widget Function(T data) builder;

  const Loader(this.loadFunction, this.builder);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState<T> extends State<Loader<T>> {
  Future<T> _future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
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
