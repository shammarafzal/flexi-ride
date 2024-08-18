import 'package:flutter/material.dart';


class AppCheckBox extends StatelessWidget {
  final bool value;

  final Function(bool?) onChanged;

  const AppCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
              ),
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.black,
                hoverColor: Colors.red,
                focusColor: Colors.black,
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class AppCheckBox extends StatelessWidget {
//   final bool value;
//   final String text;
//   final Function(bool?) onChanged;
//   final Function()? onTap;
//
//   const AppCheckBox({
//     Key? key,
//     required this.value,
//     required this.text,
//     required this.onChanged,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           child: Row(
//             //   mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: Checkbox(
//                       value: value,
//                       onChanged: onChanged,
//                       checkColor: Colors.white,
//                     )),
//               ),
//               Container(
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   child: AppText(
//                     text,
//                     color: Colors.white,
//                     size: 14,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





