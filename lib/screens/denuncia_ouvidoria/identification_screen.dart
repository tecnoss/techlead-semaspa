import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  List<RadioModel> sampleData = <RadioModel>[
    RadioModel(true, 'Sim'),
    RadioModel(false, 'Não'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'Ouvidoria'),
        leading: const Leading(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenTitle(title: 'Você deseja se identificar?'),
            const Text(
              'Selecione se deseja ou não se identificar',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        for (var element in sampleData) {
                          element.isSelected = false;
                        }
                        sampleData[0].isSelected = true;
                      });
                    },
                    child: RadioItem(sampleData[0], appColorPrimary),
                  ),
                ),
                16.width,
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        for (var element in sampleData) {
                          element.isSelected = false;
                        }
                        sampleData[1].isSelected = true;
                      });
                    },
                    child: RadioItem(sampleData[1], Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  const RadioItem(this._item, this.color, {super.key});
  final RadioModel _item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
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
