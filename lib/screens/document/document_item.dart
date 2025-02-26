import 'package:flutter/material.dart';

class ExpandablePanel extends StatefulWidget {
  final String title;
  final String text;
  // final String image;

  const ExpandablePanel({
    required this.title,
    required this.text,
    // required this.image,
    Key? key,
  }) : super(key: key);

  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (widget.image.isNotEmpty)
                  //   Image.network(widget.image),
                  const SizedBox(height: 10),
                  Text(widget.text),
                ],
              ),
            ),
        ],
      ),
    );
  }
}