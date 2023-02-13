import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semasma/widgets/custom_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.coords}) : super(key: key);
  final Map coords;

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  LatLng? _center;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _putMarker(LatLng latLng) {
    setState(() {
      _center = latLng;
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _center!,
        zoom: 17.0,
      )));
    });
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
                  initialCameraPosition: initialPosition,
                  onMapCreated: _onMapCreated,
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("marker_1"),
                      position: _center ?? LatLng(lat, long),
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
