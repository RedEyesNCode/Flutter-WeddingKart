import 'package:flutter/material.dart';

class SingleSelectableChipGroup extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String>? onChanged;
  final String? selectedOption;

  SingleSelectableChipGroup({
    required this.options,
    this.onChanged,
    this.selectedOption,
  });

  @override
  _SingleSelectableChipGroupState createState() =>
      _SingleSelectableChipGroupState();
}

class _SingleSelectableChipGroupState extends State<SingleSelectableChipGroup> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      verticalDirection: VerticalDirection.down,
      children: List<Widget>.generate(
        widget.options.length,
            (int index) {
          final option = widget.options[index];
          final isSelected = _selectedOption == option;
          return GestureDetector(
            onTap: () {
              if (!isSelected) {
                setState(() {
                  _selectedOption = option;
                });
                widget.onChanged?.call(option);
              } else {
                setState(() {
                  _selectedOption = null;
                });
                widget.onChanged?.call('');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                  colors: [ Color.fromRGBO(109, 36, 81, 1),
                    Color.fromRGBO(146, 29, 38, 1)], // Adjust gradient colors as needed
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
                    : LinearGradient(
                  colors: [ Colors.white,
                    Colors.white], // Adjust gradient colors as needed
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 16,
                    color: isSelected
                        ? Colors.white // Text color for selected chip
                        : Colors.black, // Text color for unselected chip
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
