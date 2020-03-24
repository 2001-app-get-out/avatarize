// import 'package:flutter/material.dart';
// import 'src/ml_kit.dart';
// import 'package:logging/logging.dart';

// void main() {
//   Logger.root.level = Level.ALL; // defaults to Level.INFO
//   Logger.root.onRecord.listen((record) {
//     print('${record.level.name}: ${record.time}: ${record.message}');
//   });

//   runApp(
//     MaterialApp(
//       routes: <String, WidgetBuilder>{
//         '/': (BuildContext context) => _ExampleList(),
//         '/$PictureScanner': (BuildContext context) => PictureScanner(),
//       },
//     ),
//   );
// }

// class _ExampleList extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _ExampleListState();
// }

// class _ExampleListState extends State<_ExampleList> {
//   static final List<String> _exampleWidgetNames = <String>[
//     '$PictureScanner',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example List'),
//       ),
//       body: ListView.builder(
//         itemCount: _exampleWidgetNames.length,
//         itemBuilder: (BuildContext context, int index) {
//           final String widgetName = _exampleWidgetNames[index];

//           return Container(
//             decoration: const BoxDecoration(
//               border: Border(bottom: BorderSide(color: Colors.grey)),
//             ),
//             child: ListTile(
//               title: Text(widgetName),
//               onTap: () => Navigator.pushNamed(context, '/$widgetName'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
