import 'package:flutter/material.dart';

typedef OnCodeEnteredCompletion = void Function(String value);
typedef OnCodeChanged = void Function(String value);
typedef HandleControllers = void Function(
    List<TextEditingController?> controllers);

class OtpTextField extends StatefulWidget {
  const OtpTextField({Key? key}) : super(key: key);

  @override
  OtpTextFieldState createState() => OtpTextFieldState();
}

class OtpTextFieldState extends State<OtpTextField> {
  List inputControllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      inputControllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 4; i++)
          SizedBox(
            width: 52,
            child: TextFormField(
              controller: inputControllers[i],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              focusNode: focusNodes[i],
              maxLength: 1,
              onChanged: (val) {
                if (val.isEmpty) {
                  if (i == 0) {
                    return;
                  }
                  focusNodes[i - 1].requestFocus();
                  return;
                }
                if (i == 3) {
                  _trySubmit();
                  return;
                }
                if (val.isNotEmpty) {
                  focusNodes[i + 1].requestFocus();
                }
              },
            ),
          ),
      ],
    );
  }

  void _trySubmit() {
    String enteredOtp = '';
    for (TextEditingController texts in inputControllers) {
      enteredOtp += texts.text.toString();
    }
    if (enteredOtp == '7639') {
      Navigator.of(context).pop(true);
    } else {
      Navigator.of(context).pop(false);
    }
  }
}
