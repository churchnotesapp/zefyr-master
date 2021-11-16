import 'package:flutter/material.dart';
import 'package:notus/notus.dart';
import 'package:zefyr/zefyr.dart';

class ZefyrIndent extends StatelessWidget {
  const ZefyrIndent({Key key, this.node}) : super(key: key);

  final BlockNode node;

  @override
  Widget build(BuildContext context) {
    final theme = ZefyrTheme.of(context);
    final style = theme.attributeTheme.quote.textStyle;
    final items = <Widget>[];
    for (var line in node.children) {
      items.add(_buildLine(line, style, theme.indentWidth));
    }

    return Padding(
      padding: theme.attributeTheme.quote.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items,
      ),
    );
  }

  Widget _buildLine(Node node, TextStyle blockStyle, double indentSize) {
    LineNode line = node;

    //Widget content = ZefyrParagraph(node: line, blockStyle: blockStyle);
    Widget content = ZefyrLine(
      node: line,
      style: blockStyle,
    );

    final row = Row(children: <Widget>[Expanded(child: content)]);
    return Container(
      padding: EdgeInsets.only(left: indentSize),
      child: row,
    );
  }
}
