import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';

class DropDownList extends StatefulWidget {
  GestureTapCallback? onTap;
  List items;
  TextEditingController? controller ;
  String hintext;
  DropDownList({
    Key? key,
    this.onTap,
    this.hintext = '',
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {

    print(("${widget.items} , 2"));

    return GestureDetector(
        onTap: widget.onTap ,
        child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 6.5.h,
        decoration: BoxDecoration(
        color: AppTheme.secClr(context),
        borderRadius: BorderRadius.circular(15),
        ),


        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: AppTheme.secClr(context),
            borderRadius: BorderRadius.circular(15),
            hint: Text('${widget.hintext}',),
            isExpanded: true,
            items: widget.items.map((item) => DropdownMenuItem(child: Text(item),value: item,)).toList(),
            value: (widget.controller!.text == '')? null: widget.controller!.text ,
            onChanged: (newValue){
              setState(() {
                widget.controller!.text = newValue.toString();
                print(widget.controller!.text);
              });
            },

          ),
        )
        )
    );
  }
}

