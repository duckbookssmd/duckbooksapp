import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF364D45),
        title: const Text(
          'Cadastro',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFFB899FF),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.wb_sunny_outlined,
              color: Color(0xFFB899FF),
              size: 24,
            ),
          ),
        ],
      ),
      body: const  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Colocar Tela de cadastro',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
