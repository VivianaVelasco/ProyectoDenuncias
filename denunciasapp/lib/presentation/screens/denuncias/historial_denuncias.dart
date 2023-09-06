import 'package:denunciasapp/presentation/provider/denuncias_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HistorialDenunciasScreen extends StatefulWidget {
  const HistorialDenunciasScreen({super.key});

  @override
  State<HistorialDenunciasScreen> createState() =>
      _HistorialDenunciasScreenState();
}

class _HistorialDenunciasScreenState extends State<HistorialDenunciasScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final denunciasProvider = context.watch<DenunciasProvider>();
    final historial = denunciasProvider.denunciasUsuario;

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
          children: [
            const Text(
              "Historial",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlue, fontSize: 30),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: historial.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = historial[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Motivo: ${item.motivo.name}'),
                          Text('Parroquia: ${item.parroquia.name}'),
                          Text('Fecha: ${item.createdAt}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.go("/denuncias/${item.id}");
                            },
                            child: const Text('Editar'),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Eliminar denuncia',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: const Text(
                                      '¿Deseas eliminar esta denuncia?',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancelar');
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          print("Eliminando: ${item.id}");
                                          denunciasProvider
                                              .deleteDenuncia(item.id)
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        },
                                        child: const Text('Eliminar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text('Eliminar'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
