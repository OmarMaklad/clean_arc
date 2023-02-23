import 'package:flutter/material.dart';

class DropDownTextField extends StatefulWidget {
  final List<dynamic>? items;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? icon;
  final Function()? onTap;
  final bool isModel;
  final double? paddingHor;
  final double? paddingVer;
  final Color? fillColor;
  const DropDownTextField(
      {required this.hint,
        required this.items,
        this.onChanged,
        this.onTap,
        this.isModel = false,
        this.icon,
        this.paddingHor,
        this.paddingVer,
        this.fillColor});

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  int? value;
  GlobalKey dropKey=GlobalKey();
  bool show= false;
  Widget _showDropDown(){
    return Container(
      child: Column(
        children: widget.items!
            .map((e) => DropdownMenuItem<int>(
          onTap: () {

          },
          value: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                // value = e;
                show=false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                e.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        )).toList(),

      ),
    );
  }
  void _show(){
    setState(() {
      show=!show;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          child: TextFormField(
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: EdgeInsets.symmetric(horizontal:10,vertical:10),

              suffixIcon:GestureDetector(
                onTap: (){
                  setState(() {
                    show=!show;
                  });
                },child: Icon(Icons.add)),

              filled: true,

              fillColor: Colors.white,
              // prefixText: widget.hint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:Colors.grey.withOpacity(.6),
                    width: .5),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                    Colors.transparent,width:.5),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red,width: .5),
                borderRadius: BorderRadius.circular(8),
              ),

            ),
          ),
        ),
       show==true ? Container(
         width: 150,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: Colors.red),
         ),
          child: Column(
            children: widget.items!
                .map((e) => DropdownMenuItem<int>(
              onTap: () {

              },
              value: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // value = e;
                    show=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    e.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )).toList(),

          ),
        ):SizedBox(),
      ],
    );

  }
}
