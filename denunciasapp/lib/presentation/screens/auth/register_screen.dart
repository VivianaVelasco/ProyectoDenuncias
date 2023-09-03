//import 'package:denunciasapp/presentation/widgets/complaint.dart';
import 'package:denunciasapp/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Row( mainAxisAlignment: MainAxisAlignment.center, 
      children: [ Text("Crear Cuenta", textAlign: TextAlign.center, style: TextStyle(color: Colors.lightBlue, height: 30),),
      Divider(height: 20, color: Colors.lightBlue, thickness: 2, endIndent: 0,)
      ],),
        
        
      ),
        body: const SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              
              CustomTextFormField(
                 label: 'Nombres Completos',
                 hint: 'Ingrese su nombre y apellido',
                 
              ),
              
              CustomTextFormField(
                label: 'Cedula',
                hint: 'Ingrese su numero de cedula',
                keyboardType: TextInputType.number,
              ),
              //CustomInputField()
              




            ],



          ),)
        ));
  }
}

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: 'Ingrese nombre',
      textCapitalization: TextCapitalization.words,
      onChanged: (value){
        //print('value: $value');
      },
      validator:(value) {
        if (value == null) return 'Este campo es obligatorio';
        return value.length < 4 ? 'Minimo de 4 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(hintText: 'Ingrese su nombre y apellido',
      labelText: 'Nombres Completos',
      ),
    );
  }
}
