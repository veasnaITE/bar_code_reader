import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class barcoder extends StatefulWidget {
  const barcoder({super.key});

  @override
  State<barcoder> createState() => _barcoderState();
}

class _barcoderState extends State<barcoder> {
  TextEditingController _textEditingController = TextEditingController();
  String _submittedText = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _handleSubmit(String value) {
    setState(() {
      _submittedText = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BarCoder"),),
      body: Center(
    child: SingleChildScrollView(
    child: Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BarcodeWidget( barcode: Barcode.code128(),
          data: _textEditingController.text,
        width: 200,
        height: 200,),
        SizedBox (height: 24),
        Padding (
          padding: EdgeInsets. symmetric (horizontal: 32),
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter your text',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 1.0,
                    ),
                  ),
                ),
                onFieldSubmitted: _handleSubmit,
              ),
              Text('Submitted Text: $_submittedText'),
            ],
          ),
        ), // Padding
      ],
    ),
    ),
    ),
    );
  }
}
