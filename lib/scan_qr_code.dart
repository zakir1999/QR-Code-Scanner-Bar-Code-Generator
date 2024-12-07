import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult='Scanned data will appear here';
  Future<void>scanQR() async{
    try{
      final qrCode=await FlutterBarcodeScanner.scanBarcode('#ff6666','Cancel',true,ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult=qrCode.toString();
      });
    }on PlatformException{
      qrResult='Fail to read QR Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        actions: [
          IconButton(
            onPressed:(){
              Navigator.popAndPushNamed(context, "/generate");
            },
            icon: const Icon(
              Icons.qr_code,
            ),
          ),
        ],
      ),
      body: MobileScanner(
        controller:MobileScannerController(detectionSpeed:DetectionSpeed.noDuplicates,returnImage: true),
        onDetect:(capture){
          final List<Barcode> barcodes=capture.barcodes;
          final Uint8List? image=capture.image;
          var barcode;
          for (barcode in barcodes){
            print('Barcode found! ${barcode.rawValue}');
          }
          if(image != null){
            showDialog(context: context, builder: (context){
              return AlertDialog(title: Text(barcodes.first.rawValue ?? ""),
                content: Image(image: MemoryImage(image)),
              );
            },
            );
          }
        },)
    );
  }
}
