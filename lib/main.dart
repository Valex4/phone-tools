
import 'package:flutter/material.dart';
import 'screens/gps_screen.dart';
import 'screens/qr_screen.dart';
import 'screens/sensor_screen.dart';
import 'screens/speech_to_text_screen.dart';
import 'screens/text_to_speech_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Puedes cambiar la fuente si lo deseas
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Información del Alumno",
          style: TextStyle(color: Colors.white)
          ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Información del Alumno
            Text(
              "Nombre: Yahir Alexander Gutiérrez Martínez",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "Matrícula: 221200",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            
            // Botón del Repositorio
            TextButton.icon(
              onPressed: () {
                // Lógica para abrir el repositorio
              },
              icon: Icon(Icons.code, color: Colors.blueAccent),
              label: Text("Repositorio del Proyecto"),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            // Botones de navegación a las vistas
            _buildNavigationButton(
              context,
              "Ver Ubicación GPS",
              Icons.location_on,
              GPSScreen(),
            ),
            _buildNavigationButton(
              context,
              "Leer Matrícula desde QR",
              Icons.qr_code,
              QRScreen(),
            ),
            _buildNavigationButton(
              context,
              "Ver Sensores",
              Icons.sensors,
              SensorScreen(),
            ),
            _buildNavigationButton(
              context,
              "Grabación de Audio",
              Icons.mic,
              SpeechToTextScreen(),
            ),
            _buildNavigationButton(
              context,
              "Reproducción de Texto",
              Icons.volume_up,
              TextToSpeechScreen(),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir los botones de navegación
  Widget _buildNavigationButton(BuildContext context, String label, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        icon: Icon(icon, size: 24),
        label: Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}