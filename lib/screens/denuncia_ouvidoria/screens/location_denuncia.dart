import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  LatLng? position;

  List<RadioModel> sampleData = <RadioModel>[
    RadioModel(true, 'Urbano'),
    RadioModel(false, 'Rural'),
  ];

  String? dropdownValue;

  bool _isLoading = false;

  Municipio? _selectedCity;

  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _carController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _determinePosition().then((value) {
        position = LatLng(value.latitude, value.longitude);
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Fluttertoast.showToast(
        msg:
            'A localização está permanentemente desativada para este aplicativo. Por favor, ative manualmente a localização para continuar.',
        toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        // backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<LatLng?> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Position p = await _determinePosition();
      LatLng lt = LatLng(p.latitude, p.longitude);
      return lt;
    } catch (e) {
      return null;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Municipio> municipios =
        context.read<MunicipioProvider>().getMunicipios();

    String? lat = context.watch<ReportProvider>().lat;
    String? long = context.watch<ReportProvider>().lng;
    String? end = context.watch<ReportProvider>().endereco;
    String? num = context.watch<ReportProvider>().numero;
    String? bairro = context.watch<ReportProvider>().bairro;
    String? city = context.watch<ReportProvider>().municipio;

    _latController.text = lat ?? '';
    _longController.text = long ?? '';
    _endController.text = end ?? '';
    _numController.text = num ?? '';
    _bairroController.text = bairro ?? '';

    if (city != null) {
      setState(() {
        dropdownValue = city;
        _selectedCity =
            municipios.firstWhere((element) => element.name == city);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
        leading: const Leading(),
        centerTitle: true,
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
                  child: _isLoading
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : IconButton(
                          iconSize: 100,
                          onPressed: () async {
                            if (position == null) {
                              LatLng? p = await _getCurrentLocation();
                              if (p == null) {
                                return;
                              }
                              position = p;
                            }

                            final LatLng? result = await Navigator.of(context)
                                .pushNamed("/denuncia_ouvidoria/map",
                                    arguments: {
                                  'lat': position!.latitude,
                                  'long': position!.longitude,
                                }) as LatLng?;

                            if (result == null) {
                              return;
                            } else {
                              position = result;
                              _latController.text = result.latitude.toString();
                              _longController.text =
                                  result.longitude.toString();
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/ouvidoria/map.svg',
                          ),
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
                      width: 0,
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
                RichText(
                  text: const TextSpan(
                    text: 'Número:',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
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
