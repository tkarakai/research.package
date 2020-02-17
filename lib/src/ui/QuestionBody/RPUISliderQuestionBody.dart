part of research_package_ui;

class RPUISliderQuestionBody extends StatefulWidget {
  final RPSliderAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUISliderQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUISliderQuestionBodyState createState() => _RPUISliderQuestionBodyState();
}

class _RPUISliderQuestionBodyState extends State<RPUISliderQuestionBody> with AutomaticKeepAliveClientMixin<RPUISliderQuestionBody> {
  double value;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(
              '${widget.answerFormat.prefix}${value ?? widget.answerFormat.minValue}${widget.answerFormat.suffix}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: value ?? widget.answerFormat.minValue,
              onChanged: (double newValue) {
                value = newValue;
                widget.onResultChange(value);
              },
              min: widget.answerFormat.minValue,
              max: widget.answerFormat.maxValue,
              divisions: widget.answerFormat.divisions,
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}