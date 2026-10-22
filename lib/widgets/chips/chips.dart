import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';

class Chips extends StatefulWidget {
  final List<String> items;
  final bool multi;

  const Chips(
    this.items, {
    super.key,
    this.multi = false,
  });

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  late final Set<String> sel;

  @override
  void initState() {
    super.initState();
    sel = <String>{};
    if (widget.items.isNotEmpty) {
      sel.add(widget.items.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in widget.items)
          ChoiceChip(
            label: Text(item),
            selected: sel.contains(item),
            selectedColor: cyan.withValues(alpha: 0.3),
            labelStyle: TextStyle(
              color: sel.contains(item) ? navy : Colors.black87,
              fontWeight: sel.contains(item) ? FontWeight.bold : FontWeight.normal,
            ),
            onSelected: (selected) => setState(() {
              if (!widget.multi) sel.clear();
              if (selected) {
                sel.add(item);
              } else {
                if (widget.multi || sel.length > 1) {
                  sel.remove(item);
                }
              }
            }),
          ),
      ],
    );
  }
}
