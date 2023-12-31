import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/secrets.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapScreen({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(latitude, longitude),
              minZoom: 15.0,
              maxZoom: 18.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://api.mapbox.com/styles/v1/'
                    '{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
                additionalOptions: const {
                  'accessToken': mapboxSecretAccessToken,
                  'id': 'mapbox/streets-v11',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: LatLng(latitude, longitude),
                    builder: (ctx) => const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Text(
              'Latitude: $latitude, Longitude: $longitude',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
