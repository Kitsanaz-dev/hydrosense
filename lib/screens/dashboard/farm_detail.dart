import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense/screens/dashboard/card/condition/get_ph_color.dart';
import 'package:hydrosense/screens/dashboard/card/condition/get_turbidity_color.dart';
import 'package:hydrosense/screens/dashboard/card/sensor_card.dart';
import 'package:hydrosense/src/service/theme_service.dart';

class FarmDetail extends StatelessWidget {
  final double pH;
  final double turbidity;
  final double waterLevel;

  const FarmDetail({
    Key? key,
    required this.pH,
    required this.turbidity,
    required this.waterLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 23, 122, 235)
                    .withAlpha(68),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: context.color.onPrimary,
                ),
              ),
              title: Text(
                "Dashboard",
                style: context.typo.headline4.copyWith(
                  fontWeight: context.typo.extraBold,
                  color: context.color.onPrimary,
                ),
              ),
              backgroundColor: context.color.primary,
              elevation: 0,
              toolbarHeight: 100,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Mina's Farm",
                  style: context.typo.headline2.copyWith(
                    fontWeight: context.typo.bold,
                    color: context.color.text,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SensorCard(
                label: 'pH Sensor',
                value: pH,
                description: pH < 6.9
                    ? 'Slightly acidic'
                    : pH <= 8.0
                        ? 'Neutral to\nslightly basic'
                        : 'Alkaline',
                maxValue: 14.0,
                color: getPHColor(pH),
                unit: '',
              ),
              SensorCard(
                label: 'Turbidity',
                value: turbidity,
                description: turbidity < 5
                    ? 'Clear water'
                    : turbidity <= 10
                        ? 'Slightly cloudy'
                        : turbidity <= 15
                            ? 'Cloudy water'
                            : 'Very cloudy or murky',
                maxValue: 20.0,
                color: getTurbidityColor(turbidity),
                unit: 'NTU',
              ),
              SensorCard(
                label: 'Water Level',
                value: waterLevel,
                description: 'Current\nWater level',
                maxValue: 100.0,
                color: context.color.primary,
                unit: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
