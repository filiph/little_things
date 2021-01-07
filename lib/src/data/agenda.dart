class Agenda {
  final List<AgendaItem> items;
  const Agenda(this.items);
}

class AgendaItem {
  final String name, description;
  const AgendaItem(this.name, this.description);
}
