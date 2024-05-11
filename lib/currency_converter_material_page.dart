import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  late double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  void convert() => setState(() {
        try {
          result = double.parse(textEditingController.text) * 81;
        } catch (e) {
          result = 0;
          debugPrint("Error");
        }
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        //centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\u{20B9} ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: textEditingController,
                onSubmitted: (String res) {
                  convert();
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
                ],
                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.attach_money_rounded),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
