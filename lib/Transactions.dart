import 'package:intl/intl.dart';

class Transactions {
  int id;
  String title;
  double price;
  DateTime date;
  Transactions({
    required this.id,
    required this.title,
    required this.date,
    required this.price,
  });
  String formatdate() => DateFormat('yyyy-MMMM-dd-E. HH:MM a').format(date);
}
// Column(
//   children: transactionslist.map(
//     (e) {
// return Container(
//   margin: EdgeInsets.all(20),
//   decoration: BoxDecoration(
//     color: Color(0xff51155A),
//     border: Border.all(color: Colors.black, width: 2),
//     borderRadius: BorderRadius.circular(25),
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Container(
//         width: 100,
//         margin: EdgeInsets.symmetric(
//             horizontal: 20, vertical: 15),
//         child: CircleAvatar(
//           child: FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Container(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 '\$${e.price}',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 100),
//               ),
//             ),
//           ),
//           minRadius: 50,
//           backgroundColor: Colors.red,
//         ),
//       ),
//       Expanded(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   '${e.title}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 60,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 child: Text(
//                   e.formatdate(),
//                   style: TextStyle(
//                     fontWeight: FontWeight.w100,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//     ],
//   ),
// );
//     },
//   ).toList(),
// ),
