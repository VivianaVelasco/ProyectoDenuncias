//import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:denunciasapp/presentation/widgets/complaint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentComplaints extends StatefulWidget {
  const RecentComplaints({super.key});

  @override
  State<RecentComplaints> createState() => _RecentComplaintsState();
}

class _RecentComplaintsState extends State<RecentComplaints> {
  // final DenunciasProvider denunciasProvider = DenunciasProvider();
  // List<Denuncia> denuncias = [];
  // @override
  // void initState() {
  //   super.initState();
  //   denunciasProvider.getRecentsDenuncias().then((List<Denuncia> denunciaRes) {
  //     setState(() {
  //       denuncias = [...denunciaRes];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final denunciasProvider = context.watch<DenunciasProvider>();
    final denuncias = denunciasProvider.denuncias;
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
                  itemCount: denuncias.length,
                  itemBuilder: ((context, index) {
                    return Complaint(denuncia: denuncias[index]);
                  })),



                  ),
            
          ],
        ),
      ),
    );
  }
}
