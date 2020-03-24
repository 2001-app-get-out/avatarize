import 'package:flutter/material.dart';
import 'widgets/scroll_menu.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("circle"),
        ),
        body: Center(child: CircleImages()));
  }
}

// class MyHomePage extends StatelessWidget {

//   @override
//     Widget build(BuildContext context) {
//       // TODO: implement build
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("circle"),
//         ),
//         body: Center(
//           child: Container(

//                   height: 80.0,
//                   width: 80.0,
//                   margin: EdgeInsets.only(
//                     left: 5.0,
//                     right: 5.0
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100.0),
//                     border: Border.all(
//                       width: 2.0,
//                       style:BorderStyle.solid ,
//                       color: Color.fromARGB(255, 0 , 0, 0)
//                     ),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage("https://cdn.dribbble.com/users/1368/screenshots/1785863/icons_2x.png")
//                     )
//                   )
//                 )
//         ) ,
//       );
//     }
// }

//  class BodyLayout extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//       return _myListView(context);
//     }
//   }

// Widget _myListView(BuildContext context) {
//   return ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 1.0),
//         color: Colors.tealAccent,
//         child: Text('$index'),
//       );
//     },
//   );
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File _imageFile;
//   dynamic _pickImageError;
//   String _retrieveDataError;

//   final TextEditingController maxWidthController = TextEditingController();
//   final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();

//   void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
//     await _displayPickImageDialog(context,
//         (double maxWidth, double maxHeight, int quality) async {
//       try {
//         _imageFile = await ImagePicker.pickImage(
//             source: source,
//             maxWidth: maxWidth,
//             maxHeight: maxHeight,
//             imageQuality: quality);
//         setState(() {});
//       } catch (e) {
//         _pickImageError = e;
//       }
//     });
//   }

//   Widget _previewImage() {
//     final Text retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_imageFile != null) {
//       return Image.file(_imageFile);
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'You have not yet picked an image.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await ImagePicker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       setState(() {
//         _imageFile = response.file;
//       });
//     } else {
//       _retrieveDataError = response.exception.code;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Platform.isAndroid
//             ? FutureBuilder<void>(
//                 future: retrieveLostData(),
//                 builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//                   switch (snapshot.connectionState) {
//                     case ConnectionState.none:
//                     case ConnectionState.waiting:
//                       return const Text(
//                         'You have not yet picked an image.',
//                         textAlign: TextAlign.center,
//                       );
//                     case ConnectionState.done:
//                       return _previewImage();
//                     default:
//                       if (snapshot.hasError) {
//                         return Text(
//                           'Pick image/video error: ${snapshot.error}}',
//                           textAlign: TextAlign.center,
//                         );
//                       } else {
//                         return const Text(
//                           'You have not yet picked an image.',
//                           textAlign: TextAlign.center,
//                         );
//                       }
//                   }
//                 },
//               )
//             : (_previewImage()),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () {
//               _onImageButtonPressed(ImageSource.gallery, context: context);
//             },
//             heroTag: 'image0',
//             tooltip: 'Pick Image from gallery',
//             child: const Icon(Icons.photo_library),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 _onImageButtonPressed(ImageSource.camera, context: context);
//               },
//               heroTag: 'image1',
//               tooltip: 'Take a Photo',
//               child: const Icon(Icons.camera_alt),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Text _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   Future<void> _displayPickImageDialog(
//       BuildContext context, OnPickImageCallback onPick) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Add optional parameters'),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: maxWidthController,
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   decoration:
//                       InputDecoration(hintText: "Enter maxWidth if desired"),
//                 ),
//                 TextField(
//                   controller: maxHeightController,
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   decoration:
//                       InputDecoration(hintText: "Enter maxHeight if desired"),
//                 ),
//                 TextField(
//                   controller: qualityController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       InputDecoration(hintText: "Enter quality if desired"),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: const Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               FlatButton(
//                   child: const Text('PICK'),
//                   onPressed: () {
//                     double width = maxWidthController.text.isNotEmpty
//                         ? double.parse(maxWidthController.text)
//                         : null;
//                     double height = maxHeightController.text.isNotEmpty
//                         ? double.parse(maxHeightController.text)
//                         : null;
//                     int quality = qualityController.text.isNotEmpty
//                         ? int.parse(qualityController.text)
//                         : null;
//                     onPick(width, height, quality);
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           );
//         });
//   }
// }

// typedef void OnPickImageCallback(
//     double maxWidth, double maxHeight, int quality);
