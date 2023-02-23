// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class CustomTextField extends StatefulWidget {
//   final String? hint;
//   final String? upperText;
//   final bool? label;
//   final TextInputType? type;
//   final Function(String?)? onsave;
//   final String? Function(String?)? valid;
//   final AutovalidateMode? validationMode;
//   final IconData? icon;
//   final IconData? eIcon;
//   final TextEditingController? controller;
//   final VoidCallback? onTap;
//   final String? dIcon;
//   final  FocusNode? focus;
//   final bool? read;
//   final bool? flag;
//   final bool? line;
//   final VoidCallback? edit;
//   final bool? isEdit;
//   final double? hor;
//   final bool? fillColor;
//
//   CustomTextField({ this.hint, this.onsave, this.onTap,
//     this.icon, this.type,  this.valid,  this.controller, this.focus, this.dIcon, this.label, this.read, this.eIcon, this.edit, this.isEdit, this.line, this.flag, this.hor, this.validationMode, this.upperText, this.fillColor,});
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//
//   bool _isHidden = true;
//   // Color? color=kGryColor;
//   void _visibility() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if(widget.upperText != null)
//           Padding(
//             padding:  EdgeInsets.symmetric(vertical: 10.sp),
//             child: Text(widget.upperText!,
//                 style: TextStyle(fontFamily: "RB Bold",
//                     fontWeight:FontWeight.w400,
//                     color: kPrimaryColor,
//                     fontSize: 14.sp)),
//           ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal:0,
//               vertical:widget.hor==null?5:widget.hor!),
//           child: TextFormField(
//             onTap: widget.onTap,
//             validator: widget.valid,
//             controller: widget.controller,
//             cursorColor: kPrimaryColor,
//             focusNode: widget.focus,
//             readOnly: widget.read==true?true:false,
//             maxLines: widget.line==true?6:1,
//             obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
//             keyboardType:widget.type,
//             onChanged: (v){
//               setState(() {
//
//               });
//             },
//             style: TextStyle(fontSize: 14.sp,color: kPrimaryColor,fontFamily: "RB Bold",fontWeight: FontWeight.w400),
//             decoration: InputDecoration(
//               hintText: widget.hint,
//               contentPadding: EdgeInsets.symmetric(horizontal:10,vertical:10),
//               prefixIcon: widget.dIcon!=null?
//               Image.asset(
//                 getAsset(widget.dIcon!),height: 15.h,width: 15.w,color:widget.controller!.text.isEmpty?kTextColor:kAccentColor):null,
//               // labelText: widget.label==true?widget.hint:null,
//               labelStyle: TextStyle(fontSize: 14,color:kTextColor,fontFamily: "RB Regular"),
//               hintStyle: TextStyle(fontSize:widget.line==true?12:
//               16.sp,color: kTextColor,fontFamily: "RB Regular",
//               fontWeight: FontWeight.w400),
//               suffixIcon: widget.icon == Icons.lock_outline
//                   ? IconButton(
//                 onPressed: _visibility,
//                 alignment: Alignment.center,
//                 icon: _isHidden
//                     ? Image.asset(getAsset("eyeSlash"))
//                     : Image.asset(getAsset("eye")),
//               )
//                   : Icon(widget.icon,color: kTextColor,size: 20,),
//               filled: true,
//               fillColor: Colors.white,
//               // prefixText: widget.hint,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     color:widget.controller!.text.isNotEmpty?kPrimaryColor:
//                     Colors.transparent,
//                     width:widget.controller!.text.isNotEmpty? 1.5:0),
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kPrimaryColor,width:1.5),
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
