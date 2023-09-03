//import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class DenunciasScreen extends StatelessWidget {
  const DenunciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String motivoElegido = '';
    String parroquiaElegida = '';
    final myFormkey = GlobalKey<FormState>();
    //final Map<String, String> formValues = {'motivo': '', 'parroquia': '',};


    final List<String> motivos = ['Seguridad', 'Fauna Urbana', 'Infracciones', 'Construcción', 'Espectáculos Públicos'] ;
    final List<String> parroquias = ['Ayacucho','Bolívar-Sagrario', 'Carbo-Concepción', 'Febres Cordero', ' Garcia Moreno', 'Letamendi', '9 de octubre', 'Olemdo-San Alejo', 'Roca', 'Rocafuerte', 'Sucre', 'Tarquí', 'Urdaneta', 'Ximena', 'Chongón', 'Pascuales' ];
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
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const Text(
              "Listar Denuncias",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlue, fontSize: 30),
            ),
            const SizedBox(height: 10),
           
           
            DropdownButtonFormField(
              items: parroquias.map((String parroquia){return DropdownMenuItem<String>(value: parroquia,child: Text(parroquia),);
              }).toList(), onChanged: (nwvalue) => parroquiaElegida = nwvalue.toString(),
               decoration: const InputDecoration(
                
                  border: OutlineInputBorder(),
                  labelText: "Selecciona la parroquia"),
                  ),
  
            const SizedBox(height: 10),
            
            DropdownButtonFormField(
              items: motivos.map((String motivo){return DropdownMenuItem<String>(value: motivo, child: Text(motivo));
              }).toList(), onChanged: (nwvalue)  => motivoElegido = nwvalue.toString(),
               decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Seleccione el motivo de la denuncia"),
              ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
              onPressed: () {
                        final formValid = myFormkey.currentState?.validate() ?? false;
                        if (formValid) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Filtrar"),
                              content: Text('Filtrando...'),
                            ),
                          );
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
                            color: Colors.white),)
              ),

            ),
        

          ],

        )));
        //const Text("Listar Denuncias"));
        
    
  }
  }   


 
