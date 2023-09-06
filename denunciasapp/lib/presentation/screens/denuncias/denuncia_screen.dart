import 'package:denunciasapp/domains/entities/denuncia.dart';
import 'package:denunciasapp/domains/entities/motivo.dart';
import 'package:denunciasapp/domains/entities/parroquia.dart';
import 'package:denunciasapp/domains/entities/usuario.dart';
import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DenunciaScreen extends StatefulWidget {
  final int id;

  const DenunciaScreen({super.key, required this.id});

  @override
  State<DenunciaScreen> createState() => _DenunciaScreenState();
}

class _DenunciaScreenState extends State<DenunciaScreen> {
  final formKey = GlobalKey<FormState>();

  final DenunciasProvider denunciasProvider = DenunciasProvider();
  Denuncia denuncia = Denuncia(
      id: -2,
      title: "",
      description: "",
      usuario: Usuario(id: 2, names: "", email: ""),
      parroquia: Parroquia(id: 3, name: ""),
      motivo: Motivo(id: 2, name: ""),
      createdAt: "",
      urlPhoto: "");

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final denunciasProvider = context.watch<DenunciasProvider>();
    final motivos = denunciasProvider.motivos;
    final parroquias = denunciasProvider.parroquias;

    return FutureBuilder(
        future: denunciasProvider.getDenunciaById(widget.id),
        builder: (context, AsyncSnapshot<Denuncia> snapshot) {
          if (snapshot.hasData) {
            denuncia = snapshot.data ?? denuncia;
            dateCtl.text = denuncia.createdAt;
            titleCtl.text = denuncia.title;
            descriptionCtl.text = denuncia.description;
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  title: const Text(
                    "Editar Mi Denuncia",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.go("/midenuncias"),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      onPressed: () {},
                    )
                  ],
                ),
                body: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: [
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
                          value: denuncia.motivo.name,
                          items: motivos
                              .map<DropdownMenuItem<String>>((Motivo motivo) {
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
                          value: denuncia.parroquia.name,
                          items: parroquias.map<DropdownMenuItem<String>>(
                              (Parroquia parroquia) {
                            return DropdownMenuItem<String>(
                                value: parroquia.name,
                                child: Text(parroquia.name));
                          }).toList(),
                          onChanged: (value) => idParroquia = parroquias
                              .where((Parroquia parroquia) =>
                                  parroquia.name == value)
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
                                  "idUsuario": idUsuario,
                                  "idParroquia": idParroquia,
                                  "urlPhoto": photoURL
                                };
                                if (formValid) {
                                  denunciasProvider
                                      .editDenuncia(dataJSON, widget.id)
                                      .then((value) {
                                    final statusCode =
                                        denunciasProvider.statusCodeRequest;
                                    if (statusCode == 200) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            "Denuncia Actualizada Sastifactoriamente",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500),
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
                                              onPressed: () =>
                                                  Navigator.pop(context),
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
          } else if (snapshot.hasError) {
            return const Center(
                child: Text("Ocurrio un error. Intenta mas tarde"));
          } else {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          }
        });
  }
}
