import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';



class CustomPopOver extends StatefulWidget {
  final bool? edit;

  const CustomPopOver({Key? key, this.edit}) : super(key: key);

  @override
  State<CustomPopOver> createState() => _CustomPopOverState();
}

class _CustomPopOverState extends State<CustomPopOver> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "widget.hint",
          contentPadding: EdgeInsets.symmetric(horizontal:10,vertical:10),

          suffixIcon:GestureDetector(
              onTap: ()=>showPopover(
                context: context,
                bodyBuilder: (_) {
                  return Scrollbar(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [

                        Divider(),
                        GestureDetector(

                          child: Container(
                            child: Text("1"),
                          ),),
                        // SizedBox(height: 15,),
                      ],
                    ),
                  );
                },
                transitionDuration: Duration(milliseconds: 150),
                direction: PopoverDirection.top,
                barrierDismissible: true,
                backgroundColor: Colors.white,
                width:  100,
                height:  120,
                arrowHeight: 15,
                arrowWidth: 25,
                onPop: (){
                  setState(() {

                  });

                },
              ),
              child: Icon(Icons.keyboard_arrow_down,color: Colors.grey,)),

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
                color: Colors.transparent,width:.5),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red,width: .5),
            borderRadius: BorderRadius.circular(8),
          ),

        ),
      ),
    );
  }
}




