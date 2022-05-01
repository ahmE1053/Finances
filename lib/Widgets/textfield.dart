import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldForAdding extends StatelessWidget {
  String hint;
  List<TextInputFormatter> inputformatter;
  Function Changed;
  TextInputType numornormal;
  TextFieldForAdding({
    required this.hint,
    required this.inputformatter,
    required this.Changed,
    required this.numornormal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 5,
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color(0xff51155A),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      inputFormatters: inputformatter,
      keyboardType: numornormal,
      onChanged: (value) {
        Changed(value);
      },
    );
  }
}
