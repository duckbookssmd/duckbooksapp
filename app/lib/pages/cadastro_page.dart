import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController? textController1;

  // State field(s) for TextField widget.
  TextEditingController? textController2;

  // State field(s) for TextField widget.
  TextEditingController? textController3;
  late bool passwordVisibility1;

  // State field(s) for TextField widget.
  TextEditingController? textController4;
  late bool passwordVisibility2;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: const Color(0xFF333129),
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
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'lib/assets/images/logo_white_text_no_bg.png',
                      width: 300,
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: TextFormField(
                      controller: textController1,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Matrícula/SIAPE',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF333129),
                        prefixIcon: const Icon(
                          Icons.person_rounded,
                          color: Color(0xFFF4EC70),
                          size: 20,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFB3AA3D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: TextFormField(
                      controller: textController2,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF333129),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFFF4EC70),
                          size: 20,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFB3AA3D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: TextFormField(
                      controller: textController3,
                      autofocus: false,
                      obscureText: !passwordVisibility1,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF333129),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFF4EC70),
                          size: 20,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility1 = !passwordVisibility1,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFFF4EC70),
                            size: 16,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFB3AA3D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: TextFormField(
                      controller: textController4,
                      autofocus: false,
                      obscureText: !passwordVisibility2,
                      decoration: InputDecoration(
                        labelText: 'Confirmar Senha',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFB3AA3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF333129),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFF4EC70),
                          size: 20,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility2 = !passwordVisibility2,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFFF4EC70),
                            size: 16,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFB3AA3D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 5),
                    child: TextButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // _formKey.currentState?.save();
              
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Cadastrando...'),
                                backgroundColor: Colors.green),
                          );
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(130, 40),
                        foregroundColor: const Color(0xFFF4EC70),
                        elevation: 0,
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        shape: const StadiumBorder(
                            side: BorderSide(color: Color(0xFFC2CC93), width: 3.5)),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFF4EC70),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Cadastre-se'),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(185, 40),
                        foregroundColor: const Color(0xFFF4EC70),
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFF4EC70),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: const Text('Já possui cadastro ?'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
