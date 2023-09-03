import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? iconPrefix;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  
  const CustomTextFormField({
    this.controller,
    this.onTap,
    this.iconPrefix,
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        // borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(5));

    return TextFormField(
      controller: controller,
      onTap: onTap,
      validator: validator,
      obscureText: obscureText,

     //keyboardType: TextInputType,
      decoration: InputDecoration(
        prefixIcon: iconPrefix != null ? Icon(iconPrefix) : null,
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
      ),
    );



  }
}
