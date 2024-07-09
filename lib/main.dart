import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/category.dart';
import 'package:wallpaper_app/view/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   double _progress = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     requestStoragePermission();
//   }
//
//   Future<void> requestStoragePermission() async {
//     PermissionStatus status = await Permission.storage.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Storage permission is required to download images')),
//       );
//     }
//   }
//
//   Future<void> downloadImage() async {
//     Dio dio = Dio();
//
//     try {
//       // Get the application directory
//       Directory dir = await getApplicationDocumentsDirectory();
//       String savePath = '${dir.path}/downloaded_image.jpg';
//
//       await dio.download(
//         'https://images.pexels.com/photos/26976092/pexels-photo-26976092.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
//         savePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             setState(() {
//               _progress = received / total;
//             });
//           }
//         },
//       );
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Download Completed')),
//       );
//       print('Image saved at: $savePath');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Download Failed')),
//       );
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Downloader with Progress"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: downloadImage,
//               child: Text("Download Image"),
//             ),
//             SizedBox(height: 20),
//             _progress > 0
//                 ? LinearProgressIndicator(value: _progress)
//                 : Container(),
//             SizedBox(height: 10),
//             Text('${(_progress * 100).toStringAsFixed(0)}%'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


