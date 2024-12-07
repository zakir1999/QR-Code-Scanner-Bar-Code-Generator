import 'package:flutter/material.dart';
import 'package:qrcode_scanner/generate_qr_code.dart';
import 'package:qrcode_scanner/scan_qr_code.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.pink,
      ),
      home:Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('QR Code Scanner and Generator'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(onPressed: (){
             setState(() {
               Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ScanQrCode()));
             });
           }, child: Text('Scan QR Code')),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>GenerateQrCode()));
              });
            }, child: Text('Generate QR Code'))

          ],
        ),
      ),
    );
  }
}


