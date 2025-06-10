import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense/screens/dashboard/card/farm_card.dart';
import 'package:hydrosense/screens/this_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ThisAppBar(
          appbartitle: 'History',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("sensor_history")
              .snapshots(),
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
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No sensor history available'),
              );
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                // Extract data from the Firestore document
                final data = docs[index].data() as Map<String, dynamic>;
                final double pH =
                    (data['pH'] == null) ? 0.0 : (data['pH'] as num).toDouble();

                final double turbidity = (data['turbidity'] == null)
                    ? 0.0
                    : (data['turbidity'] as num).toDouble();

                final double waterLevel = (data['waterLevel'] == null)
                    ? 0.0
                    : (data['waterLevel'] as num).toDouble();

                return FarmCard(
                  pH: pH,
                  turbidity: turbidity,
                  waterLevel: waterLevel,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
