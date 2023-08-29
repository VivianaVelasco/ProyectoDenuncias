import 'dart:convert';

import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearDenunciasScreen extends StatefulWidget {
  const CrearDenunciasScreen({super.key});

  @override
  State<CrearDenunciasScreen> createState() => _CrearDenunciasScreenState();
}

class _CrearDenunciasScreenState extends State<CrearDenunciasScreen> {
  final formKey = GlobalKey<FormState>();

  String title = "";
  String description = "";
  int idUsuario = 2;
  int idParroquia = 1;
  int idMotivo = 1;
  DateTime date = DateTime.now();

  final List<String> parroquias = [
    "Cuidad 1",
    "Cuidad 2",
    "Cuidad 3",
    "Cuidad 4",
    "Cuidad 5",
    "Cuidad 6"
  ];

  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final discoverProvider = context.watch<DenunciasProvider>();
    return Scaffold(
        appBar: AppBar(title: const Text("Crear Denuncia")),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Nombre",
                  hint: "Ex. Robo en Ceibos",
                  onChanged: (value) => title = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes ingresar el titulo de la denuncia';
                    }
                    return null;
                  },
                  iconPrefix: Icons.title,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Detalles",
                  hint: "Ex. Ocurrio en ... y despues ...",
                  onChanged: (value) => description = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes ingresar los detalles de la denuncia.';
                    }
                    return null;
                  },
                  iconPrefix: Icons.description,
                ),
                const SizedBox(height: 10),
                // Row(
                //   children: [
                //     const Text("Motivo de la denuncia"),
                //     const SizedBox(height: 5),
                //     DropdownMenu(
                //       initialSelection: discoverProvider.motivos.first.name,
                //       onSelected: (value) =>
                //           idMotivo = int.parse(value ?? "-1"),
                //       dropdownMenuEntries: discoverProvider.motivos
                //           .map<DropdownMenuEntry<String>>((Motivo motivo) {
                //         return DropdownMenuEntry<String>(
                //             value: motivo.id.toString(), label: motivo.name);
                //       }).toList(),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10),
                DropdownButtonFormField(
                  items: parroquias
                      .map<DropdownMenuItem<String>>((String parroquia) {
                    return DropdownMenuItem<String>(
                        value: parroquia, child: Text(parroquia));
                  }).toList(),
                  onChanged: (value) =>
                      idParroquia = parroquias.indexOf(value ?? parroquias[0]),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selecciona una parroquia"),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: dateCtl,
                  label: "Fecha",
                  hint: "Selecciona la fecha que ocurrio el suceso",
                  onChanged: (value) => date = DateTime.now(),
                  iconPrefix: Icons.date_range_outlined,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime date = DateTime(1900);
                    date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100)) ??
                        DateTime.now();

                    dateCtl.text = date.toIso8601String();
                  },
                ),

                // DatePickerDialog(
                //     currentDate: DateTime.now(),
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(2015, 8),
                //     lastDate: DateTime(2030)),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        final formValid =
                            formKey.currentState?.validate() ?? false;
                        final dataJSON = {
                          "title": title,
                          "description": description,
                          "idMotivo": 3,
                          "dateIndicent": dateCtl.text,
                          "urlPhoto": "foto1.png",
                          "idUsuario": 3,
                          "idParroquia": idParroquia
                        };
                        if (formValid) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Envio de Formulario"),
                              content: Text(json.encode(dataJSON).toString()),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Enviar Denuncia",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
