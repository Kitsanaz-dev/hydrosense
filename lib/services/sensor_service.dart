import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SensorService extends ChangeNotifier {
  final Dio _dio = Dio();

  //Hotspot Wi-Fi
  // final String _baseUrl = 'http://172.20.10.3:1880/api/sensor';

  //Home Wi-Fi
  final String _baseUrl = 'http://192.168.100.17:1880/api/sensor';

  //K-Lab Wi-Fi
  // final String _baseUrl = 'http://192.168.1.123:1880/api/sensor';


  // Create a broadcast StreamController so multiple listeners can subscribe
  final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();

  SensorService() {
    _startPolling();
  }

  void _startPolling() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      try {
        final data = await fetchSensorData();
        _controller.add(data);
      } catch (error) {
        _controller.addError(error);
      }
    });
  }

  Future<Map<String, dynamic>> fetchSensorData() async {
    final response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load sensor data. Status: ${response.statusCode}');
    }
  }

  // Expose the sensor data stream
  Stream<Map<String, dynamic>> get sensorDataStream => _controller.stream;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
