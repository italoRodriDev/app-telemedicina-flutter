import 'package:flutter/material.dart';

class DoubleSelectComponent extends StatefulWidget {
  final String labelBtnOne;
  final String labelBtnTwe;
  final Color? colorSelected;
  final Color? colorUnselected;
  final Color? colorLabelSelected;
  final Color? colorLabelUnselected;
  final Function onPressedBtnOne;
  final Function onPressedBtnTwe;
  final double borderRadius;

  const DoubleSelectComponent({
    super.key,
    required this.labelBtnOne,
    required this.labelBtnTwe,
    this.colorSelected,
    this.colorUnselected,
    this.colorLabelSelected,
    this.colorLabelUnselected,
    required this.onPressedBtnOne,
    required this.onPressedBtnTwe,
    this.borderRadius = 16.0,
  });

  @override
  State<DoubleSelectComponent> createState() => _DoubleSelectComponentState();
}

class _DoubleSelectComponentState extends State<DoubleSelectComponent> {
  bool isFirstSelected = true;

  void _selectFirst() {
    setState(() {
      isFirstSelected = true;
    });
    widget.onPressedBtnOne();
  }

  void _selectSecond() {
    setState(() {
      isFirstSelected = false;
    });
    widget.onPressedBtnTwe();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selectedColor = widget.colorSelected ?? theme.colorScheme.secondary;
    final unselectedColor =
        widget.colorUnselected ?? theme.colorScheme.primary.withOpacity(0.08);

    final selectedLabelColor = widget.colorLabelSelected ?? Colors.white;
    final unselectedLabelColor =
        widget.colorLabelUnselected ?? theme.colorScheme.primary;

    return Row(
      children: [
        // Botão 1
        GestureDetector(
          onTap: _selectFirst,
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              color: isFirstSelected ? selectedColor : unselectedColor,
              border: Border.all(
                color:
                    isFirstSelected ? Colors.transparent : unselectedLabelColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Text(
              widget.labelBtnOne,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color:
                    isFirstSelected ? selectedLabelColor : unselectedLabelColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Botão 2
        GestureDetector(
          onTap: _selectSecond,
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              color: !isFirstSelected ? selectedColor : unselectedColor,
              border: Border.all(
                color: !isFirstSelected
                    ? Colors.transparent
                    : unselectedLabelColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Text(
              widget.labelBtnTwe,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: !isFirstSelected
                    ? selectedLabelColor
                    : unselectedLabelColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
