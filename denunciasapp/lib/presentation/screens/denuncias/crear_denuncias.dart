import 'dart:convert';
import 'dart:io';

import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/services/camera_galery_service_impl.dart';
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
  String photoURL = "";

  final List<String> parroquias = [
    "Cuidad 1",
    "Cuidad 2",
    "Cuidad 3",
    "Cuidad 4",
    "Cuidad 5",
    "Cuidad 6"
  ];

  final List<String> motivos = [
    "Robo",
    "Extorsion",
    "Maltrato Animal",
    "Acoso",
    "Asesinato",
    "Otros"
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
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: _ImageGallery(photoUrl: photoURL),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              final photoPath =
                                  await CameraGaleryServiceImpl().selectPhoto();
                              if (photoPath == null) return;
                              photoURL = photoPath.trim();
                            },
                            icon: const Icon(Icons.download)),
                        const Text("Importar una imagen")
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  label: "Nombre de la denuncia",
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  items: motivos.map<DropdownMenuItem<String>>((String motivo) {
                    return DropdownMenuItem<String>(
                        value: motivo, child: Text(motivo));
                  }).toList(),
                  onChanged: (value) =>
                      idMotivo = motivos.indexOf(value ?? motivos[0]),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selecciona el motivo"),
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
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
                          "idParroquia": idParroquia,
                          "imgUrl": photoURL
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

class _ImageGallery extends StatelessWidget {
  final String photoUrl;

  const _ImageGallery({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: photoUrl.isEmpty
          ? ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/no-image.jpg",
                fit: BoxFit.cover,
              ),
            )
          : ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: FadeInImage(
                fit: BoxFit.fill,
                image: checkTypePhoto(),
                placeholder: const AssetImage("assets/images/no-image.jpg"),
              ),
            ),
    );
  }

  dynamic checkTypePhoto() {
    return photoUrl.startsWith("http")
        ? NetworkImage(photoUrl)
        : FileImage(File(photoUrl));
  }
}
