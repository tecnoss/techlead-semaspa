import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../models/municipio_model.dart';
import '../repository/municipio_provider.dart';
import '../repository/report_provider.dart';
import '../widgets/radio_item.dart';

class LocationDenunciaScreen extends StatefulWidget {
  const LocationDenunciaScreen({super.key});

  @override
  State<LocationDenunciaScreen> createState() => _LocationDenunciaScreenState();
}

class _LocationDenunciaScreenState extends State<LocationDenunciaScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<RadioModel> sampleData = <RadioModel>[
    RadioModel(true, 'Urbano'),
    RadioModel(false, 'Rural'),
  ];

  String? dropdownValue;

  Municipio? _selectedCity;

  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _carController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Municipio> municipios =
        context.read<MunicipioProvider>().getMunicipios();
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenTitle(title: 'Onde ocorreu o ato ilícito?'),
                const Text(
                  'Selecione o tipo de localização',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.height,
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
                16.height,
                const Text(
                  'Clique no Mapa e selecione a localização do Ato Ilícito:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.height,
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/ouvidoria/map.svg',
                    height: 100,
                  ),
                ),
                16.height,
                const Text(
                  'ou Digite o Endereço da localização do Ato Ilícito:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.height,
                const Text(
                  'Latitude:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _latController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Digite a Latitude',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Longitude:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _longController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Digite a Longitude',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                RichText(
                  text: const TextSpan(
                    text: 'Município:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Selecione o município';
                      }
                      return null;
                    },
                    menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                    value: dropdownValue != "" ? dropdownValue : null,
                    hint: const Text(
                      'Selecione o município de onde foi o ato ilícito',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.expand_more),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
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
                    items: municipios
                        .map<DropdownMenuItem<String>>((Municipio value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name!),
                      );
                    }).toList(),
                  ),
                ),
                16.height,
                RichText(
                  text: const TextSpan(
                    text: 'Endereço:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                4.height,
                SizedBox(
                  // height: 40,
                  child: TextFormField(
                    controller: _endController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Digite o endereço',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Número:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  // height: 40,
                  child: TextField(
                    controller: _numController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Digite o número',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Bairro:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  child: TextField(
                    controller: _bairroController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Digite o bairro',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Pontos de Referência:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _refController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'Opcional',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Nº CAR:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _carController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      hintText: 'PA-15000800-F36DCD8C21684B29A6 C51301E83B6230',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                16.height,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ReportProvider>().setData(
                            tipoLocalizacao:
                                sampleData[0].isSelected ? 'Urbano' : 'Rural',
                            lat: _latController.text,
                            lng: _longController.text,
                            municipio: _selectedCity!.name!,
                            endereco: _endController.text,
                            numero: _numController.text,
                            bairro: _bairroController.text,
                            pontoReferencia: _refController.text,
                            ncar: _carController.text,
                          );
                      Navigator.pushNamed(
                          context, '/denuncia_ouvidoria/data_location');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Prosseguir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
