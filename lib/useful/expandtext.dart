import 'package:flutter/material.dart';

class exptext extends StatefulWidget {
  final String myText;
  exptext({@required this.myText});
  @override
  _exptext createState() => _exptext();
}

class _exptext extends State<exptext> {
  var showAll = true;
  final length = 15;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: <InlineSpan>[
        TextSpan(
            text: widget.myText.length > length && !showAll
                ? widget.myText.substring(0,length) + "..."
                : widget.myText,style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),),
        widget.myText.length > length

            ? WidgetSpan(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showAll = !showAll;
              });
            },
            child: Text(
              showAll ? 'read less' : 'read more!',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        )
            : TextSpan(),
      ],
    ));
  }
}

