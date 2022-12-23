import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.isRequired,
    required this.hintText,
    this.isSelect = false,
    this.dropdownOptions = const <String>[],
    this.maxLines = 1,
  });
  final String label;
  final bool isRequired;
  final String hintText;
  final bool isSelect;
  final List<String> dropdownOptions;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: isRequired
                ? const <TextSpan>[
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]
                : const <TextSpan>[],
          ),
        ),
        4.height,
        isSelect
            ? _dropdownButton(dropdownOptions, hintText)
            : _textField(hintText, maxLines),
      ],
    );
  }

  Widget _textField(String hintText, int maxLines) {
    return SizedBox(
      height: maxLines == 1 ? 40 : null,
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          isDense: true,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 10,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _dropdownButton(List<String> options, String hintText) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: null,
        hint: Text(
          hintText,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 10,
          ),
        ),
        isExpanded: true,
        icon: const Icon(Icons.expand_more),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (value) {},
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
