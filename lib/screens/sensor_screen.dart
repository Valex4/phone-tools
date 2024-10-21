import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  // Variables para almacenar datos del acelerómetro
  double _accelerometerX = 0.0;
  double _accelerometerY = 0.0;
  double _accelerometerZ = 0.0;

  // Variables para almacenar datos del giroscopio
  double _gyroscopeX = 0.0;
  double _gyroscopeY = 0.0;
  double _gyroscopeZ = 0.0;

  // Variables para almacenar datos del magnetómetro
  double _magnetometerX = 0.0;
  double _magnetometerY = 0.0;
  double _magnetometerZ = 0.0;

  @override
  void initState() {
    super.initState();

    // Escuchar los cambios del acelerómetro
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerX = event.x;
        _accelerometerY = event.y;
        _accelerometerZ = event.z;
      });
    });

    // Escuchar los cambios del giroscopio
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeX = event.x;
        _gyroscopeY = event.y;
        _gyroscopeZ = event.z;
      });
    });

    // Escuchar los cambios del magnetómetro
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _magnetometerX = event.x;
        _magnetometerY = event.y;
        _magnetometerZ = event.z;
      });
    });
  }

  Widget _buildSensorCard(String title, IconData icon, List<String> values) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map((value) => Text(value)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sensores del Dispositivo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          _buildSensorCard(
            "Acelerómetro",
            Icons.directions_run,
            [
              'X: ${_accelerometerX.toStringAsFixed(2)}',
              'Y: ${_accelerometerY.toStringAsFixed(2)}',
              'Z: ${_accelerometerZ.toStringAsFixed(2)}',
            ],
          ),
          _buildSensorCard(
            "Giroscopio",
            Icons.screen_rotation,
            [
              'X: ${_gyroscopeX.toStringAsFixed(2)}',
              'Y: ${_gyroscopeY.toStringAsFixed(2)}',
              'Z: ${_gyroscopeZ.toStringAsFixed(2)}',
            ],
          ),
          _buildSensorCard(
            "Magnetómetro",
            Icons.explore,
            [
              'X: ${_magnetometerX.toStringAsFixed(2)}',
              'Y: ${_magnetometerY.toStringAsFixed(2)}',
              'Z: ${_magnetometerZ.toStringAsFixed(2)}',
            ],
          ),
        ],
      ),
    );
  }
}