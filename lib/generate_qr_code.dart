import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  String? qrData;
  TextEditingController urlController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Generate QR Code'),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.popAndPushNamed(context, "/scan");
          },
          icon: const Icon(Icons.qr_code_scanner),
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[TextField(onSubmitted: (value){
            setState((){
              qrData=value;
            });

          },),
            if(qrData != null) PrettyQrView.data(data:qrData!)
          ],
        ),
      )
    );
  }
}

