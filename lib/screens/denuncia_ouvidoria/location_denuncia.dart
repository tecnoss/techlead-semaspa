import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import 'widgets/radio_item.dart';

class LocationDenunciaScreen extends StatefulWidget {
  const LocationDenunciaScreen({super.key});

  @override
  State<LocationDenunciaScreen> createState() => _LocationDenunciaScreenState();
}

const List<String> locations = <String>[
  'Abaetetuba',
  'Altamira',
  'Ananindeua',
  'Belém',
  'Bragança',
];

class _LocationDenunciaScreenState extends State<LocationDenunciaScreen> {
  List<RadioModel> sampleData = <RadioModel>[
    RadioModel(false, 'Urbano'),
    RadioModel(false, 'Rural'),
  ];

  String dropdownValue = locations[0];

  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
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
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {
                    if (newValue == null) return;
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items:
                      locations.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
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
              const SizedBox(
                height: 40,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
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
              const SizedBox(
                height: 40,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
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
                'Bairro:',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              4.height,
              const SizedBox(
                height: 40,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/denuncia_ouvidoria/location');
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
    );
  }
}
