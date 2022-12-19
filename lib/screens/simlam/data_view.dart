import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:semasma/screens/simlam/process.dart';
import 'package:semasma/utils/app_colors.dart';

class SimpleTablePage extends StatefulWidget {
  const SimpleTablePage({
    Key? key,
    required this.proccess,
  }) : super(key: key);
  final Proccess proccess;

  @override
  State<StatefulWidget> createState() {
    return _SimpleTablePageState();
  }
}

class _SimpleTablePageState extends State<SimpleTablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 100,
      rightHandSideColumnWidth: 390,
      tableHeight: widget.proccess.proccessInfo.length * 33.0 + 32,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: widget.proccess.proccessInfo.length,
      rowSeparatorWidget: const Divider(
        color: Colors.black54,
        height: 1.0,
        thickness: 0.0,
      ),
      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      horizontalScrollbarStyle: const ScrollbarStyle(
        thumbColor: appColorPrimary,
        isAlwaysShown: true,
        thickness: 1.0,
        radius: Radius.circular(5.0),
      ),
      scrollPhysics: const NeverScrollableScrollPhysics(),
      horizontalScrollPhysics: const ClampingScrollPhysics(),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('N° Processo', 200),
      _getTitleItemWidget('Empreendimento', 150),
      _getTitleItemWidget('Interessado', 100),
      _getTitleItemWidget('Situação', 80),
      _getTitleItemWidget('Ações', 60),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 24,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      decoration: const BoxDecoration(
        color: appColorPrimary,
        border: Border(
          right: BorderSide(
            width: 1.5,
            color: Colors.white,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 32,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Center(
        child: Text(widget.proccess.proccessInfo[index].numero,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _contentColumn(
          title: widget.proccess.proccessInfo[index].empreendimento,
          size: 150,
        ),
        _contentColumn(
          title: widget.proccess.proccessInfo[index].interessado,
          size: 100,
        ),
        _contentColumn(
          title: widget.proccess.proccessInfo[index].situacao,
          size: 80,
        ),
        Container(
          width: 60,
          height: 32,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: const Center(
            child: Icon(
              Icons.manage_search,
              color: appColorPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _contentColumn({required String title, required double size}) {
    return Container(
      width: size,
      height: 32,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
