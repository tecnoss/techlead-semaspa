import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/report_provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/custom_button.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../models/address_model.dart';
import '../utils/convert_coord.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.coords}) : super(key: key);
  final Map coords;

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late ValueNotifier<LatLng> _center;

  Address? _address;

  void _showAddressDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: scaffoldColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.height,
              Text(
                "Localização",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              24.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _field(
                    label: "Latitude",
                    value: convertCoord(_address?.lat ?? 0),
                  ),
                  8.height,
                  _field(
                    label: "Longitude",
                    value: convertCoord(_address?.lng ?? 0),
                  ),
                  8.height,
                  _field(
                    label: "Rua",
                    value: _address?.street ?? "",
                  ),
                  8.height,
                  _field(
                    label: "Bairro",
                    value: _address?.distrit ?? "",
                  ),
                  8.height,
                  _field(
                    label: "Cidade",
                    value: _address?.city ?? "",
                  ),
                  8.height,
                  _field(
                    label: "Número",
                    value: _address?.number ?? "",
                  ),
                  24.height,
                  CustomButton(
                    onPressed: () {
                      context.read<ReportProvider>().setAddress(
                            endereco: _address?.street ?? "",
                            numero: _address?.number ?? "",
                            bairro: _address?.distrit ?? "",
                            municipio: _address?.city ?? "",
                            lat: convertCoord(_address?.lat ?? 0),
                            lng: convertCoord(_address?.lng ?? 0),
                          );

                      Navigator.of(context).pop();
                      Navigator.of(context).pop(LatLng(
                        _address?.lat ?? 0,
                        _address?.lng ?? 0,
                      ));
                    },
                    text: "Prosseguir",
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _field({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        4.height,
        TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(4.0),
            isDense: true,
          ),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _putMarker(LatLng latLng) async {
    setState(() {
      _center.value = latLng;
    });
    _centralizarMarcador();
    _getAddress();
  }

  Future<void> _centralizarMarcador() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: _center.value,
        zoom: 17,
      ),
    ));
  }

  Future<void> _getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _center.value.latitude, _center.value.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _address = Address(
          lat: _center.value.latitude,
          lng: _center.value.longitude,
          street: place.street,
          city: place.subAdministrativeArea,
          distrit: place.subLocality,
          number: place.subThoroughfare,
        );
      });
      _showAddressDialog();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao obter endereço"),
        ),
      );
    }
  }

  @override
  void initState() {
    _center = ValueNotifier<LatLng>(
      LatLng(widget.coords["lat"], widget.coords["long"]),
    );
    _centralizarMarcador();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lat = widget.coords["lat"];
    final long = widget.coords["long"];

    CameraPosition initialPosition =
        CameraPosition(target: LatLng(lat, long), zoom: 17.0);

    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: "Localização",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: screenHeight,
                child: GoogleMap(
                  onTap: _putMarker,
                  mapType: MapType.hybrid,
                  initialCameraPosition: initialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("marker_1"),
                      position: _center.value,
                    ),
                  },
                ),
              ),
              Positioned(
                top: 5,
                width: size.width * 0.8,
                left: size.width * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    "Selecione o ponto onde ocorreu o\n Ato Ilícito",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color: Colors.white,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ).paddingAll(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
