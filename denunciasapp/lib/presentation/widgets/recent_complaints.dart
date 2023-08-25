import 'package:denunciasapp/presentation/widgets/complaint.dart';
import 'package:flutter/material.dart';

class RecentComplaints extends StatelessWidget {
  const RecentComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Denuncias Más Recientes",
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Roboto"),
              textAlign: TextAlign.center,
            ),
            const Divider(
              color: Colors.black,
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Complaint(text: "Denuncia $index");
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
