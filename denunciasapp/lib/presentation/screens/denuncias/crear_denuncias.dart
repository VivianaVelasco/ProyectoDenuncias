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

  String name = "";
  String description = "";
  int idUsuario = 2;
  int idParroquia = 1;
  int idMotivo = 1;
  String date = "";

  final List<String> parroquias = [
    "Cuidad 1",
    "Cuidad 2",
    "Cuidad 3",
    "Cuidad 4",
    "Cuidad 5",
    "Cuidad 6"
  ];

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
                    onChanged: (value) => name = value),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Detalles",
                  hint: "Ex. Ocurrio en ... y despues ...",
                  onChanged: (value) => description = value,
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
                  onChanged: (value) => description = value ?? "-1",
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Selecciona una parroquia"),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Fecha",
                  hint: "Ex. 20/03/2023",
                  onChanged: (value) => date = value,
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
                      onPressed: (() {}),
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
