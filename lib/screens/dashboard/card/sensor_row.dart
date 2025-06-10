import 'package:flutter/material.dart';
import 'package:hydrosense/src/service/theme_service.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SensorRow extends StatelessWidget {
  final String label;
  final String value;
  final double gaugeValue; // Current sensor reading
  final double gaugeMax; // Max possible reading
  final Color color;

  const SensorRow({
    super.key,
    required this.label,
    required this.value,
    required this.gaugeValue,
    required this.gaugeMax,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sensor label
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: context.typo.body2.copyWith(
                fontWeight: context.typo.semiBold,
                color: context.color.text,
              ),
            ),
          ),

          // Sensor value
          SizedBox(
            width: 90,
            child: Text(
              value,
              style: context.typo.body2.copyWith(
                fontWeight: context.typo.semiBold,
                color: context.color.text,
              ),
            ),
          ),

          // Horizontal gauge
          Expanded(
            child: SizedBox(
              height: 12, // Gauge thickness to match image
              child: SfLinearGauge(
                minimum: 0,
                maximum: gaugeMax,
                orientation: LinearGaugeOrientation.horizontal,
                showLabels: false,
                showTicks: false,
                axisTrackStyle: const LinearAxisTrackStyle(
                  thickness: 12,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: Color(0xFFEEEEEE),
                  borderWidth: 0,
                ),
                barPointers: [
                  LinearBarPointer(
                    value: gaugeValue,
                    thickness: 12,
                    color: color,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
