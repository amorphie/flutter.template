import 'package:burgan_core/burgan_core.dart';
import 'package:flutter/material.dart';

class BrgDropdownFormField extends StatelessWidget {
  final List<String> itemList;
  final TextEditingController controller;
  final String? labelText;

  const BrgDropdownFormField({
    Key? key,
    required this.itemList,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: itemList.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
      onChanged: (String? value) {
        controller.text = value.orEmpty;
      },
      icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 24),
      isExpanded: true,
      borderRadius: BorderRadius.circular(16),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
