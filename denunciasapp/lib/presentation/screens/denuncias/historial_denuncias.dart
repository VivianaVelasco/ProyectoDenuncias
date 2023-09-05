import 'package:flutter/material.dart';


class HistorialDenunciasScreen extends StatefulWidget {
  const HistorialDenunciasScreen({super.key});

  @override
  State<HistorialDenunciasScreen> createState() => _HistorialDenunciasScreenState();
}

class _HistorialDenunciasScreenState extends State<HistorialDenunciasScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historial = [
      {'titulo': 'Maltrato Animal', 'motivo': 'Fauna Urbana', 'parroquia': 'Olemdo-San Alejo', 'fecha': '10-10-2022'},
      {'titulo': 'Robo a viviendas', 'motivo': 'Seguridad', 'parroquia': 'Sucre', 'fecha': '10-08-2023'},
      {'titulo': 'Asalto a mano armada', 'motivo': 'Seguridad', 'parroquia': 'Roca', 'fecha': '25-08-2023'},
      {'titulo': 'Asalto a mano armada', 'motivo': 'Seguridad', 'parroquia': 'Roca', 'fecha': '10-08-2023'},
      {'titulo': 'Asalto a mano armada', 'motivo': 'Seguridad', 'parroquia': 'Roca', 'fecha': '25-08-2023'},
      {'titulo': 'Pelea entre vecinos', 'motivo': 'Espectáculos Públicos', 'parroquia': 'Carbo-Concepción', 'fecha': '25-08-2023'},
      {'titulo': 'Construcción en área privada', 'motivo': 'Construcción', 'parroquia': 'Bolívar-Sagrario', 'fecha': '12-08-2023'},
    ];

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
                      title: Text(item['titulo']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Motivo: ${item['motivo']}'),
                          Text('Parroquia: ${item['parroquia']}'),
                          Text('Fecha: ${item['fecha']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () { },
                            child: const Text('Editar'),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return  const AdvertenciaEliminar();
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

class AdvertenciaEliminar extends StatelessWidget {
  const AdvertenciaEliminar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar denuncia', textAlign: TextAlign.center,),
      content: const Text('¿Deseas eliminar esta denuncia?', textAlign: TextAlign.center,),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancelar');
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Eliminar');
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
