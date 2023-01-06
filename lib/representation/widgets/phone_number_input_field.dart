import 'package:flutter/material.dart';
import 'package:evira/config/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class PhoneNumberInputField extends StatelessWidget {
  TextEditingController controller ;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  GestureTapCallback? onTap;
  PhoneNumberInputField({
    Key? key ,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
  }) : super(key: key);

  late String phoneNumber ;

  @override
  Widget build (BuildContext context)  {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 6.5.h,
      decoration: BoxDecoration(
        color: AppTheme.secClr(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          controller.text = number.phoneNumber.toString();
          print(controller.text);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        keyboardAction: TextInputAction.next,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,),

        ignoreBlank: true,
        cursorColor: AppTheme.activeClr(context),
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.grey),
        //textFieldController: controller,
        formatInput: false,
        keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: InputBorder.none,
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },

      ),
    );
  }
}
