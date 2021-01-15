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
      top: allDone ? 100 : -420,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
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

class _CardContentsState extends State<_CardContents>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _CardContents oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isDone && widget.isDone) {
      _controller.duration = const Duration(milliseconds: 3000);
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ScaleTransition(
          scale: CurvedAnimation(
            curve: Interval(
              0.2,
              0.6,
              curve: Curves.elasticOut,
            ),
            parent: _controller,
          ),
          child: Text('🎉', style: TextStyle(fontSize: 50)),
        ),
        SizedBox(height: 20),
        Text(
          'Congratulations!',
          style: theme.textTheme.headline4.copyWith(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: TrackedOutText(
            'You have successfully completed watching this talk. '
            'You get 50 completely meaningless virtual points!',
            CurvedAnimation(curve: Interval(0.5, 0.9), parent: _controller),
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

class TrackedOutText extends StatefulWidget {
  final String text;

  final List<String> _slices;

  final Animation<double> progress;

  final TextAlign textAlign;
  final TextStyle style;

  TrackedOutText(
    this.text,
    this.progress, {
    this.textAlign,
    this.style,
  }) : _slices = _generateSlices(text).toList(growable: false);

  static Iterable<String> _generateSlices(String text) sync* {
    const step = 2;
    var i = 0;
    for (; i < text.length - step; i += step) {
      yield text.substring(i, i + step);
    }
    yield text.substring(i);
  }

  @override
  _TrackedOutTextState createState() => _TrackedOutTextState();
}

class _TrackedOutTextState extends State<TrackedOutText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.progress,
      builder: (BuildContext context, Widget child) {
        return Text.rich(
          TextSpan(
            children: [
              // XXX: This should be cached instead of recreating everything
              // on each frame.
              for (var i = 0; i < widget._slices.length; i++)
                TextSpan(
                    text: widget._slices[i],
                    style: (i / widget._slices.length < widget.progress.value)
                        ? null
                        : TextStyle(color: Colors.transparent))
            ],
          ),
          textAlign: widget.textAlign,
          style: widget.style,
        );
      },
    );
  }
}
