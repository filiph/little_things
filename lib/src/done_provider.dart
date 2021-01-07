import 'package:flutter/cupertino.dart';
import 'package:little_things_list/src/agenda.dart';

class DoneNotifier extends ChangeNotifier {
  final _state = <AgendaItem>{};

  bool isDone(AgendaItem item) => _state.contains(item);

  void toggle(AgendaItem item) {
    if (_state.contains(item)) {
      _state.remove(item);
    } else {
      _state.add(item);
    }
    notifyListeners();
  }
}
