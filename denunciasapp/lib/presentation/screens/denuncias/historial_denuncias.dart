import 'package:flutter/material.dart';

class HistorialDenunciasScreen extends StatelessWidget {
  const HistorialDenunciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> historial = [
      {'titulo': 'Restaurante insalubre', 'fecha': '10-10-2022'},
      {'titulo': 'Robo a viviendas', 'fecha': '10-08-2023'},
      {'titulo': 'Asalto a mano armada', 'fecha': '25-08-2023'},
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.1,
                columns: const [
                  DataColumn(label: Text('Titulo')),
                  DataColumn(label: Text('Fecha')),
                  DataColumn(label: Text('Editar')),
                  DataColumn(label: Text('Eliminar')),
                ],
                rows: historial.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data['titulo'])),
                      DataCell(Text(data['fecha'])),
                      DataCell(IconButton(
                          icon: const Icon(Icons.edit_document),
                          onPressed: () {})),
                      DataCell(IconButton(
                          icon: const Icon(Icons.delete), onPressed: () {}))
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
