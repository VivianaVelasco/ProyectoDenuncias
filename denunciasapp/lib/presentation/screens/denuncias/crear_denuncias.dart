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
                // Row(
                //   children: [
                //     const Text("Parroquia del lugar denunciado"),
                //     const SizedBox(height: 5),
                //     DropdownMenu(
                //       initialSelection: discoverProvider.parroquias.first.name,
                //       onSelected: (value) =>
                //           idMotivo = int.parse(value ?? "-1"),
                //       dropdownMenuEntries: discoverProvider.parroquias
                //           .map<DropdownMenuEntry<String>>(
                //               (Parroquia parroquia) {
                //         return DropdownMenuEntry<String>(
                //             value: parroquia.id.toString(),
                //             label: parroquia.name);
                //       }).toList(),
                //     ),
                //   ],
                // ),
                CustomTextFormField(
                  label: "Fecha",
                  hint: "Ex. 20/03/2023",
                  onChanged: (value) => date = value,
                ),
                ElevatedButton(
                    onPressed: (() {}), child: Text("Enviar Denuncia"))
              ],
            ),
          ),
        ));
  }
}
