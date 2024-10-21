/* import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GPSScreen extends StatefulWidget {
  @override
  _GPSScreenState createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el servicio de GPS está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Servicio de GPS deshabilitado
      return;
    }

    // Verifica los permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permisos denegados, no podemos proceder
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permisos denegados permanentemente
      return;
    }

    // Obtener la posición actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _position = position;
    });
  }

  // Método para abrir Google Maps con la ubicación actual
  Future<void> _openMaps() async {
    if (_position != null) {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${_position!.latitude},${_position!.longitude}';
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'No se puede abrir Google Maps';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubicación GPS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: _position != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Latitud: ${_position?.latitude}"),
                  Text("Longitud: ${_position?.longitude}"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _openMaps, // Llama a la función para abrir Google Maps
                    child: Text("Abrir en Google Maps"),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GPSScreen extends StatefulWidget {
  @override
  _GPSScreenState createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el servicio de GPS está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Servicio de GPS deshabilitado
      return;
    }

    // Verifica los permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permisos denegados, no podemos proceder
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permisos denegados permanentemente
      return;
    }

    // Obtener la posición actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _position = position;
    });
  }

  // Método para abrir Google Maps con la ubicación actual
  Future<void> _openMaps() async {
    if (_position != null) {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${_position!.latitude},${_position!.longitude}';
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'No se puede abrir Google Maps';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubicación GPS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: _position != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tarjeta para mostrar la latitud y longitud
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.my_location, color: Colors.blueAccent),
                              SizedBox(width: 10),
                              Text(
                                "Latitud: ${_position?.latitude}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.redAccent),
                              SizedBox(width: 10),
                              Text(
                                "Longitud: ${_position?.longitude}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botón para abrir Google Maps con ícono
                  ElevatedButton.icon(
                    onPressed: _openMaps,
                    icon: Icon(Icons.map), // Icono de mapa
                    label: Text("Abrir en Google Maps"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}