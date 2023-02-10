import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/models/municipio_model.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/municipio_provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/subject_provider.dart';
import 'package:semasma/widgets/custom_scaffold.dart';

import '../models/subject_model.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  Municipio? _selectedCity;
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    Subject subject = context.read<SubjectRepository>().selectedSubject;
    List<Municipio> municipios =
        context.read<MunicipioProvider>().getMunicipios();
    return CustomScaffold(
      appBarTitle: 'Cidade',
      screenTitle: subject.name,
      child: [
        24.height,
        const Text(
          'A Ouvidoria da SEMAS sede Belém informa que este tipo de denúncia é realizado com a SEMAS Municipal.',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        24.height,
        const Text(
          'Município:',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Container(
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
            menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.centerLeft,
            value: dropdownValue != "" ? dropdownValue : null,
            hint: const Text(
              'Selecione o município',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
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
            onChanged: (String? newValue) {
              if (newValue == null) return;

              Municipio municipio = municipios.firstWhere(
                (element) => element.name == newValue,
              );

              setState(() {
                dropdownValue = newValue;
                _selectedCity = municipio;
              });
            },
            items: municipios.map<DropdownMenuItem<String>>((Municipio value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name!),
              );
            }).toList(),
          ),
        ),
        24.height,
        _selectedCity != null ? _buildData() : Container(),
      ],
    );
  }

  Widget _buildData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dados do município:',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        if (_selectedCity!.endereco != "") ...[
          16.height,
          const Text(
            'Endereço',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          4.height,
          selectableText('${_selectedCity!.endereco}'),
        ],
        if (_selectedCity!.telefones != "") ...[
          16.height,
          const Text(
            'Telefone',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          4.height,
          selectableText('${_selectedCity!.telefones}'),
        ],
        if (_selectedCity!.emails != "") ...[
          16.height,
          const Text(
            'E-mail',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          4.height,
          selectableText('${_selectedCity!.emails}'),
        ],
        if (_selectedCity!.site != "") ...[
          16.height,
          const Text(
            'Site',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          4.height,
          selectableText('${_selectedCity!.site}'),
        ],
      ],
    );
  }

  Widget selectableText(String text) {
    return SelectableText(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      showCursor: true,
      cursorWidth: 2,
      cursorRadius: const Radius.circular(5),
      cursorColor: Colors.black,
      autofocus: false,
    );
  }
}
