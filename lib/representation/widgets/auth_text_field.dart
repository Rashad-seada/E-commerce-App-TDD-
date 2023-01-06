import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  TextEditingController? controller;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? hint;
  String? lable;
  TextInputAction textInputAction;
  bool obscure;
  TextInputType? textInputType;
  AuthTextField({
    Key? key ,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.lable,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    required this.hint,
    this.obscure = false})
      : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: (value){
        setState(() {});
      },
      textInputAction: widget.textInputAction,
      cursorColor: AppTheme.activeClr(context),
      obscureText: widget.obscure && isSecure,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.lable,
        floatingLabelStyle: TextStyle(color : AppTheme.activeClr(context),fontSize: 18),


        prefixIcon: Icon(widget.prefixIcon,color: (widget.controller?.text == '')? Colors.grey: AppTheme.activeClr(context),size: 20,),
        suffixIcon:(widget.obscure)? IconButton(onPressed: () {
          setState(() {
            isSecure = !isSecure;
          });
        }, icon: Icon((isSecure)? Icons.remove_red_eye : Icons.visibility_off, color: (isSecure)? Colors.grey : AppTheme.activeClr(context),)) : null ,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.activeClr(context),width: 1.4),
          borderRadius: BorderRadius.circular(12),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.activeClr(context),width: 1.4),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
