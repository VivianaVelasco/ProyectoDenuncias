//import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/presentation/widgets/complaint.dart';
import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'dart:io';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
//import 'package:denunciasapp/infrastructure/services/camera_galery_service_impl.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
//import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DenunciasScreen extends StatefulWidget {
  const DenunciasScreen({super.key});

  @override
  State<DenunciasScreen> createState() => _DenunciasScreenState();
}

class _DenunciasScreenState extends State<DenunciasScreen> {
  final formKey = GlobalKey<FormState>();
  int idMotivoElegido = 0;
  int idParroquiaElegida = 0;
  List<Denuncia> denuncias = [];

  @override
  Widget build(BuildContext context) {
    final denunciasProvider = context.watch<DenunciasProvider>();
    final motivos = denunciasProvider.motivos;
    final parroquias = denunciasProvider.parroquias;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "Denuncias",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Listar Denuncias",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlue, fontSize: 30),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  validator: (value) =>
                      value == null ? 'Debes ingresar la parroquia' : null,
                  items: parroquias
                      .map<DropdownMenuItem<String>>((Parroquia parroquia) {
                    return DropdownMenuItem<String>(
                        value: parroquia.name, child: Text(parroquia.name));
                  }).toList(),
                  onChanged: (value) => idParroquiaElegida = parroquias
                      .where((Parroquia parroquia) => parroquia.name == value)
                      .elementAt(0)
                      .id,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selecciona la parroquia"),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  items: motivos.map<DropdownMenuItem<String>>((Motivo motivo) {
                    return DropdownMenuItem<String>(
                        value: motivo.name, child: Text(motivo.name));
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Debes ingresar el motivo' : null,
                  onChanged: (value) => idMotivoElegido = motivos
                      .where((Motivo motivo) => motivo.name == value)
                      .elementAt(0)
                      .id,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Seleccione el motivo de la denuncia"),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (idMotivoElegido != 0 || idParroquiaElegida != 0) {
                          denunciasProvider
                              .getDenunciaByFilters(
                                  idParroquiaElegida, idMotivoElegido)
                              .then(
                                  (List<Denuncia> denunciasResult) => setState(
                                        () {
                                          denuncias = [...denunciasResult];
                                        },
                                      ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title:
                                        const Text("Error! No se ha filtrado."),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Regresar'))
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Filtrar",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: denuncias.isEmpty
                        ? const Text("No hay denuncias que mostrar")
                        : ListView.builder(
                            itemCount: denuncias.length,
                            itemBuilder: (context, index) {
                              return Complaint(denuncia: denuncias[index]);
                            },
                          ),
                  ),
                )
              ],
            )));
    //const Text("Listar Denuncias"));
  }
}
