// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../constants/app_text_style.dart';
// import '../constants/color_palette.dart';
// import '../constants/image_path.dart';
// import '../reponsive/SizeConfig.dart';
//
// Widget CustomDropdown({
//   String? labelTitle,
//   String? hintText,
//   required void Function(String?)? onChanged,
//   bool? isrequired = false,
//   String? selectedValue,
//   double? iconsize,
// Key? formKey,
//   final Function(String?)? validation,
//   List<String>? listofitems,
//   required BuildContext context,
// }) => Column(
//     mainAxisSize: MainAxisSize.min,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         children: [
//           Text(
//             labelTitle!,
//             style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//                 fontSize: 14 * SizeConfig.textMultiplier!,
//                 fontWeight: FontWeight.w400,
//                 color: grey128,
//                 height: 1.5),
//           ),
//           isrequired == true
//               ? Text(
//                   ' *',
//                   style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//                       fontSize: 14 * SizeConfig.textMultiplier!,
//                       fontWeight: FontWeight.w400,
//                       color: red212,
//                       height: 1.5),
//                 )
//               : Container(),
//         ],
//       ),
//       SizedBox(
//         height: 4 * SizeConfig.heightMultiplier!,
//       ),
//       // drop down
//       DropdownButtonHideUnderline(
//         child: DropdownButtonFormField2(
//           selectedItemHighlightColor: yellow248,
//           dropdownMaxHeight: 200,
//           validator: validation as String? Function(String?)?,
//           key: formKey,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16 * SizeConfig.widthMultiplier!,
//                 vertical: 12 * SizeConfig.heightMultiplier!),
//             errorBorder: const OutlineInputBorder(
//               borderSide: BorderSide(width: 1.0, color: red212),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(4),
//               ),
//             ),
//             disabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1.0 * SizeConfig.widthMultiplier!,
//                     color: white238),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(4),
//                 )),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1.0 * SizeConfig.widthMultiplier!, color: grey128),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(4),
//                 )),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1.0 * SizeConfig.widthMultiplier!,
//                     color: white238),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(4),
//                 )),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1.0 * SizeConfig.widthMultiplier!,
//                     color: white238),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(4),
//                 )),
//           ),
//           hint: Text(
//             hintText!,
//             style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//               fontSize: 16 * SizeConfig.textMultiplier!,
//               fontWeight: FontWeight.w400,
//               color: grey128,
//             ),
//           ),
//           dropdownDecoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(8)),
//           iconSize: iconsize ?? 0,
//           iconEnabledColor: grey128,
//           icon: Icon(
//             Icons.arrow_drop_down,
//             size: 28 * SizeConfig.heightMultiplier!,
//           ),
//           items: listofitems!
//               .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(
//                     item,
//                       style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//                         fontSize: 18 * SizeConfig.textMultiplier!,
//                         fontWeight: FontWeight.w400,
//                         color: grey62,
//                       ),
//                     ),
//
//                   ))
//               .toList(),
//           value: selectedValue,
//           onChanged: onChanged,
//           buttonWidth: 312 * SizeConfig.widthMultiplier!,
//           itemHeight: 41 * SizeConfig.heightMultiplier!,
//         ),
//       ),
//     ],
//   );
//
// class CustomMultiSelectDropdown extends StatefulWidget {
//   CustomMultiSelectDropdown(
//       {this.hintText,
//       this.labelTitle,
//       this.selectedValue,
//        this.selectedItems,
//       this.iconsize = 25,
//       this.isrequired,
//       this.listofitems,
//         this.validation,
//         this.formKey,
//       required this.onChanged,
//       Key? key,})
//       : super(key: key);
//   String? labelTitle;
//   String? hintText;
//   Key? formKey;
//   bool? isrequired = false;
//   String? selectedValue;
//   double? iconsize;
//    Function(String?)? validation;
//   List<String>? listofitems;
//   List<String>? selectedItems;
//   ValueChanged<List<String>>? onChanged;
//
//
//   @override
//   State<CustomMultiSelectDropdown> createState() =>
//       _CustomMultiSelectDropdownState();
// }
//
// class _CustomMultiSelectDropdownState extends State<CustomMultiSelectDropdown> {
//   List<String> selectedItems = [];
//
//   Rx<Color> color = greyEE.obs;
//
//
//   @override
//   void initState() {
//     selectedItems = widget.selectedItems??[];
//   }
//
//   @override
//   Widget build(BuildContext context) => Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.labelTitle!,
//               style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//                   fontSize: 16 * SizeConfig.textMultiplier!,
//                   fontWeight: FontWeight.w400,
//                   color: grey128,
//                   height: 1.5),
//             ),
//             widget.isrequired == true
//                 ? Text(
//                     ' *',
//                     style: AppTextStyle1.normalGreyTTCommon400.copyWith(
//                         fontSize: 14 * SizeConfig.textMultiplier!,
//                         fontWeight: FontWeight.w400,
//                         color: red212,
//                         height: 1.5),
//                   )
//                 : Container(),
//           ],
//         ),
//         SizedBox(
//           height: 4 * SizeConfig.heightMultiplier!,
//         ),
//         DropdownButtonHideUnderline(
//           child: DropdownButtonFormField2(
//             key: widget.formKey,
//             selectedItemHighlightColor: yellow248,
//             validator: widget.validation as String? Function(String?)?,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(
//                   horizontal: 2 * SizeConfig.widthMultiplier!,
//                   vertical: 2 * SizeConfig.heightMultiplier!),
//               errorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(width: 1.0, color: red212),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(4),
//                 ),
//               ),
//               disabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1.0 * SizeConfig.widthMultiplier!,
//                       color: white238),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(4),
//                   )),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1.0 * SizeConfig.widthMultiplier!, color: grey128),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(4),
//                   )),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1.0 * SizeConfig.widthMultiplier!,
//                       color: white238),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(4),
//                   )),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1.0 * SizeConfig.widthMultiplier!,
//                       color: white238),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(4),
//                   )),
//             ),
//             onMenuStateChange: (v) {
//               if (v) {
//                 color.value = grey128;
//               } else {
//                 color.value = greyEE;
//               }
//             },
//             items: widget.listofitems!.map((item) => DropdownMenuItem<String>(
//                 value: item,
//                 //disable default onTap to avoid closing menu when selecting an item
//                 enabled: false,
//                 child: StatefulBuilder(
//                   builder: (context, menuSetState) {
//                     bool _isSelected =
//                         selectedItems.asMap().containsValue(item);
//                     return InkWell(
//                       onTap: () {
//                         _isSelected
//                             ? selectedItems.remove(item)
//                             : selectedItems.add(item);
//                         //This rebuilds the StatefulWidget to update the button's text
//                         setState(() {});
//                         //This rebuilds the dropdownMenu Widget to update the check mark
//                         menuSetState(() {});
//                         widget.onChanged!(selectedItems);
//                       },
//                       child: Container(
//                         height: double.infinity,
//                         // padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               height: 19.2 * SizeConfig.widthMultiplier!,
//                               width: 19.2 * SizeConfig.widthMultiplier!,
//                               child: Checkbox(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(4.0))),
//                                   side: BorderSide(
//                                       color: grey128,
//                                       width: 1.5 * SizeConfig.widthMultiplier!),
//                                   checkColor: whiteFF,
//                                   activeColor: grey62,
//                                   value: _isSelected,
//                                   onChanged: (value) {
//                                     _isSelected
//                                         ? selectedItems.remove(item)
//                                         : selectedItems.add(item);
//                                     setState(() {});
//                                     //This rebuilds the dropdownMenu Widget to update the check mark
//                                     menuSetState(() {
//                                       widget.onChanged!(selectedItems);
//                                     });
//                                   }),
//                             ),
//                             SizedBox(width: 14 * SizeConfig.widthMultiplier!),
//                             Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )).toList(),
//             //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
//             value: selectedItems.isEmpty ? null : selectedItems.last,
//             onChanged: (value) {
//               widget.onChanged!(selectedItems);
//             },
//             customButton: Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 16 * SizeConfig.widthMultiplier!,
//                     vertical: selectedItems.isEmpty
//                         ? 6 * SizeConfig.heightMultiplier!
//                         : 6 * SizeConfig.heightMultiplier!),
//                 width: Get.width,
//                 height: selectedItems.isEmpty
//                     ? 49 * SizeConfig.heightMultiplier!
//                     : null,
//                 // decoration: BoxDecoration(
//                 //   border: Border.all(color: color.value),
//                 //   borderRadius: const BorderRadius.all(
//                 //     Radius.circular(4),
//                 //   ),
//                 // ),
//                 child: Row(
//                   children: [
//                     selectedItems.isEmpty
//                         ? Expanded(
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   widget.hintText!,
//                                   style: AppTextStyle1.normalGreyTTCommon400
//                                       .copyWith(
//                                     fontSize: 18 * SizeConfig.textMultiplier!,
//                                     fontWeight: FontWeight.w400,
//                                     color: grey128,
//                                   ),
//                                 )),
//                           )
//                         : Expanded(
//                             child: RichText(
//                                 text: TextSpan(
//                                     children: List.generate(
//                                         selectedItems.length, (index) => WidgetSpan(
//                                   child: Container(
//                                 decoration: BoxDecoration(
//                                     color: greyEE,
//                                     borderRadius: BorderRadius.circular(
//                                         5 * SizeConfig.widthMultiplier!)),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 8 * SizeConfig.widthMultiplier!,
//                                     vertical: 6 * SizeConfig.heightMultiplier!),
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 3 * SizeConfig.widthMultiplier!,
//                                     vertical: 4 * SizeConfig.heightMultiplier!),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       selectedItems[index],
//                                       style: AppTextStyle1.normalGreyTTCommon400
//                                           .copyWith(
//                                               color: black3E, fontSize: 16),
//                                     ),
//                                     SizedBox(
//                                       width: 4 * SizeConfig.widthMultiplier!,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         selectedItems.removeAt(index);
//                                         setState(() {
//
//                                         });
//                                         widget.onChanged!(selectedItems);
//                                       },
//                                       child: Container(
//                                           color: Colors.transparent,
//                                           child: const Icon(
//                                             Icons.close,
//                                             color: black3E,
//                                             size: 18,
//                                           )),
//                                     )
//                                   ],
//                                 ),
//                               ))))),
//                           ),
//                     SvgPicture.asset(ImagePath.bottomArrowIcon),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
// }