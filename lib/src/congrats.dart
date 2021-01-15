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
      top: allDone ? 180 : -420,
      duration: const Duration(milliseconds: 500),
      child: RepaintBoundary(
        child: Card(
          shape: CircleBorder(),
          elevation: 12,
          child: Padding(
            padding:
                EdgeInsets.only(top: 130, left: 50, right: 50, bottom: 110),
            child: _CardContents(allDone),
          ),
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
    final theme = Theme.of(context);

    return Column(
      children: [
        Text('🎉', style: TextStyle(fontSize: 50)),
        SizedBox(height: 20),
        Text(
          'Congratulations!',
          style: theme
              .textTheme
              .headline4
              .copyWith(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Text(
            'You have successfully completed watching this talk. '
            'You get 50 completely meaningless virtual points!',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText2.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
