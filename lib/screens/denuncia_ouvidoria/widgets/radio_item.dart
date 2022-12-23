import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}

class RadioItem extends StatelessWidget {
  const RadioItem(this._item, this.color, {super.key});
  final RadioModel _item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: Center(
              child: _item.isSelected
                  ? const Icon(
                      Icons.check,
                      size: 24.0,
                      color: Colors.white,
                    )
                  : Container(),
            ),
          ),
          8.width,
          Center(
            child: Text(
              _item.buttonText,
              style: TextStyle(
                fontWeight:
                    _item.isSelected ? FontWeight.bold : FontWeight.normal,
                color: !_item.isSelected ? Colors.black54 : Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
