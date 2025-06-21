import 'package:flutter/material.dart';
import 'package:hydrosense/screens/dashboard/farm_detail.dart';
import 'package:hydrosense/screens/dashboard/card/condition/get_ph_color.dart';
import 'package:hydrosense/screens/dashboard/card/condition/get_turbidity_color.dart';
import 'package:hydrosense/screens/dashboard/card/sensor_row.dart';
import 'package:hydrosense/theme/theme_service.dart';

class FarmCard extends StatelessWidget {
  final String name;
  final double pH;
  final double turbidity;
  final double waterLevel;
  const FarmCard({
    super.key,
    required this.name,
    required this.pH,
    required this.turbidity,
    required this.waterLevel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FarmDetail(
              name: "Mina's Farm",
              pH: pH,
              turbidity: turbidity,
              waterLevel: waterLevel,
            ),
          ),
        );
      },
      child: Card(
        color: context.color.background,
        margin: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: context.color.stroke,
            width: 2, // optional stroke
          ),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                name,
                style: context.typo.headline6.copyWith(
                  fontWeight: context.typo.extraBold,
                  color: context.color.text,
                ),
              ),

              const SizedBox(height: 24),

              // pH row
              SensorRow(
                label: "pH",
                value: pH.toStringAsFixed(2),
                gaugeValue: pH,
                gaugeMax: 14,
                color: getPHColor(
                  pH,
                ),
              ),

              const SizedBox(height: 6),

              // turbidity row
              SensorRow(
                label: "Turbidity",
                value: "${turbidity.toStringAsFixed(2)} NTU",
                gaugeValue: turbidity,
                gaugeMax: 20,
                color: getTurbidityColor(
                  turbidity,
                ),
              ),

              const SizedBox(height: 6),

              // Water level row
              SensorRow(
                label: "Water level",
                value: "${waterLevel.toStringAsFixed(0)} %",
                gaugeValue: waterLevel,
                gaugeMax: 100,
                color: context.color.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
