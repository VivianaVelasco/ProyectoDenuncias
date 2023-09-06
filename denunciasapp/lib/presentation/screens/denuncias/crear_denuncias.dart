import 'dart:io';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/infrastructure/services/camera_galery_service_impl.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  TextEditingController dateCtl = TextEditingController();
  TextEditingController titleCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final denunciasProvider = context.watch<DenunciasProvider>();
    final motivos = denunciasProvider.motivos;
    final parroquias = denunciasProvider.parroquias;
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
                  controller: titleCtl,
                  label: "Nombre de la denuncia",
                  hint: "Ex. Robo en Ceibos",
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
                  controller: descriptionCtl,
                  label: "Detalles",
                  hint: "Ex. Ocurrio en ... y despues ...",
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
                  items: motivos.map<DropdownMenuItem<String>>((Motivo motivo) {
                    return DropdownMenuItem<String>(
                        value: motivo.name, child: Text(motivo.name));
                  }).toList(),
                  onChanged: (value) => idMotivo = motivos
                      .where((Motivo motivo) => motivo.name == value)
                      .elementAt(0)
                      .id,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selecciona el motivo"),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  items: parroquias
                      .map<DropdownMenuItem<String>>((Parroquia parroquia) {
                    return DropdownMenuItem<String>(
                        value: parroquia.name, child: Text(parroquia.name));
                  }).toList(),
                  onChanged: (value) => idParroquia = parroquias
                      .where((Parroquia parroquia) => parroquia.name == value)
                      .elementAt(0)
                      .id,
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
                          "title": titleCtl.text,
                          "description": descriptionCtl.text,
                          "idMotivo": idMotivo,
                          "dateIndicent": dateCtl.text,
                          "idUsuario": idUsuario,
                          "idParroquia": idParroquia,
                          "urlPhoto": photoURL
                        };
                        if (formValid) {
                          denunciasProvider
                              .createDenuncia(dataJSON)
                              .then((value) {
                            final statusCode =
                                denunciasProvider.statusCodeRequest;
                            if (statusCode == 200) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Denuncia Creada Sastifactoriamente",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  content: const Text(
                                      "Tu denuncia ha sido guarda correctamente. Revisa tu historial de denuncias."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => context.go('/'),
                                      child: const Text('Aceptar'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Ocurrio un error",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: const Text(
                                      "Estamos teniendo problemas para guardar correctamente. Intenta mas tarde."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
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

  const _ImageGallery({required this.photoUrl});

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
