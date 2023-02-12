import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semasma/widgets/custom_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  LatLng _center = const LatLng(45.521563, -122.677433);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _putMarker(LatLng latLng) {
    setState(() {
      _center = latLng;
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _center,
        zoom: 17.0,
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a localização'),
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
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: _onMapCreated,
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("marker_1"),
                      position: _center,
                    ),
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.pop(context, _center);
                      },
                      text: "Confirmar",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
