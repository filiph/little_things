import 'package:flutter/cupertino.dart';
import 'package:little_things_list/src/data/agenda.dart';

class DoneNotifier extends ChangeNotifier {
  static const _agendaLength = 6;

  final _state = <AgendaItem>{};

  bool get isAllDone => _state.length >= _agendaLength;

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
