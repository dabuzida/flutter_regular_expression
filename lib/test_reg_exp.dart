import 'package:flutter/material.dart';

class TestRegExp extends StatefulWidget {
  const TestRegExp({Key? key}) : super(key: key);

  @override
  State<TestRegExp> createState() => _TestRegExpState();
}

class _TestRegExpState extends State<TestRegExp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool? isPass;
  final Map<String, String> _map = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 700,
      // height: 300,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      padding: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _textEditingController,
              autofocus: true,
              onEditingComplete: () {
                _formKey.currentState!.validate();
              },
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  isPass = null;

                  // _map.addEntries(<String, String>{'f': ''});
                  _map.addAll(<String, String>{'': 'null'});
                  setState(() {});
                  return;
                }
                // ***** 테스트 조건 *****
                // 길이: 4~20
                // 소문자 영어, 숫자
                // 시작은 영어로

                // final RegExp regExp = RegExp('^(https://)');
                // final RegExp regExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
                // final RegExp regExp = RegExp(r'\d');
                // final RegExp regExp = RegExp(r'abc');
                final RegExp regExp = RegExp(r'^[a-z][a-z0-9]{3,19}$');
                // final RegExp regExp = RegExp(r'[a-z][a-z0-9]{3,19}');
                // final RegExp regExp = RegExp(r'^[a-z][a-z0-9]{3,19}$');
                // final RegExp regExp = RegExp(r'[a-z]');

                final bool isValid = regExp.hasMatch(value!);

                if (!isValid) {
                  isPass = false;
                  _map.addAll(<String, String>{value: isValid.toString()});
                  setState(() {});
                  return;
                } else {
                  isPass = true;
                  _map.addAll(<String, String>{value: isValid.toString()});
                  setState(() {});
                  return;
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          if (isPass == null)
            const Text('텍스트를 입력하세요')
          else if (isPass!)
            Icon(
              Icons.sentiment_very_satisfied,
              size: 100,
              color: Colors.greenAccent.shade400,
            )
          else
            const Icon(
              Icons.sentiment_very_dissatisfied,
              size: 100,
              color: Colors.red,
            ),
          const SizedBox(height: 50),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: _makeHistory(),
          ),
        ],
      ),
    );
  }

  Widget _makeHistory() {
    final List<Widget> widgets = <Widget>[];
    for (var element in _map.entries) {
      widgets.add(
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          // width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(element.key),
              const Text(' >> '),
              Text(element.value),
            ],
          ),
        ),
      );
    }

    return Column(children: widgets.reversed.toList());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
