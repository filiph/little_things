import 'package:flutter/material.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:provider/provider.dart';

class CongratsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allDone =
        context.select<DoneNotifier, bool>((value) => value.isAllDone);

    return AnimatedPositioned(
      left: 40,
      right: 40,
      top: allDone ? 200 : -270,
      duration: const Duration(milliseconds: 500),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 20),
          child: _CardContents(allDone),
        ),
      ),
    );
  }
}

class _CardContents extends StatefulWidget {
  final bool isDone;

  const _CardContents(this.isDone);

  @override
  _CardContentsState createState() => _CardContentsState();
}

class _CardContentsState extends State<_CardContents> {
  @override
  void didUpdateWidget(covariant _CardContents oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isDone && widget.isDone) {
      // TODO: start the showing animation
      print('starting show animation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Congratulations!',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 10),
        Text('🎉', style: TextStyle(fontSize: 50)),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            'You have successfully completed watching this talk. '
            'You get 50 completely meaningless virtual points!',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
