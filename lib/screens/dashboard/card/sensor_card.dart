import 'package:flutter/material.dart';
import 'package:hydrosense/theme/theme_service.dart';

class SensorCard extends StatelessWidget {
  final String label;
  final double value;
  final String description;
  final double maxValue;
  final Color color;
  final String unit;

  const SensorCard({
    super.key,
    required this.label,
    required this.value,
    required this.description,
    required this.maxValue,
    required this.color,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    final bool noUnit = unit.isEmpty;
    // Compose a single string for the sensor's display value
    final displayValue = noUnit
        ? value.toStringAsFixed(2)
        : '${value.toStringAsFixed(2)}\n$unit';
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      shadowColor: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sensor label
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // Circle chart for the sensor value
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: CircularProgressIndicator(
                          value: value / maxValue,
                          valueColor: AlwaysStoppedAnimation(color),
                          backgroundColor: Colors.grey.shade300,
                          strokeWidth: 12,
                          semanticsLabel: label,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Text(
                        displayValue,
                        textAlign: noUnit ? TextAlign.center : TextAlign.left,
                        style: context.typo.headline2.copyWith(
                          fontWeight: context.typo.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 50),

                  // Sensor value and description
                  Text(
                    description,
                    style: context.typo.subtitle1.copyWith(
                      fontWeight: context.typo.regular,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
