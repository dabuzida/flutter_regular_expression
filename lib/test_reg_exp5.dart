import 'package:flutter/material.dart';

class TestRegExp5 extends StatefulWidget {
  const TestRegExp5({Key? key}) : super(key: key);

  @override
  State<TestRegExp5> createState() => _TestRegExp5State();
}

class _TestRegExp5State extends State<TestRegExp5> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 길이: 4~20
    // 소문자 영어, 숫자
    // 시작은 영어로
    return Container(
      // width: 700,
      // height: 300,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      padding: const EdgeInsets.all(50),
      child: TextFormField(
        controller: _textEditingController,
        autofocus: true,
        onEditingComplete: () {
          print(1);
        },
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
