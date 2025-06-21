import 'package:flutter/material.dart';
import 'package:hydrosense/screens/dashboard/card/farm_card.dart';
import 'package:hydrosense/screens/this_app_bar.dart';
import 'package:hydrosense/services/sensor_service.dart';
import 'package:hydrosense/theme/theme_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SensorService sensorService = SensorService();

  @override
  void dispose() {
    sensorService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(
          100,
        ),
        child: ThisAppBar(
          appbartitle: 'Water Quality Dashboard',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: StreamBuilder<Map<String, dynamic>>(
            stream: sensorService.sensorDataStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No sensor data available'),
                );
              }

              final data = snapshot.data!;

              // Provide default 0.0 if any field is null
              final double pH =
                  (data['pH'] == null) ? 0.0 : (data['pH'] as num).toDouble();

              final double turbidity = (data['turbidity'] == null)
                  ? 0.0
                  : (data['turbidity'] as num).toDouble();

              final double waterLevel = (data['waterLevel'] == null)
                  ? 0.0
                  : (data['waterLevel'] as num).toDouble();

              return FarmCard(
                name: "Mina's Farm",
                pH: pH,
                turbidity: turbidity,
                waterLevel: waterLevel,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sensorService.fetchSensorData();
        },
        child: Icon(
          Icons.refresh_outlined,
          color: context.color.primary,
          size: 25,
        ),
      ),
    );
  }
}
