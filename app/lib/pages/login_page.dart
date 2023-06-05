import 'package:app/pages/home_page_ca.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? texMatriculaController;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? texSenhaController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? texSenhaControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    super.dispose();
    texMatriculaController?.dispose();
    texSenhaController?.dispose();
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
            'Login',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 90, 0, 50),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller:  texMatriculaController,
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
                      inputFormatters: <TextInputFormatter>[ // Só numeros / nó maximo 7 dígitos
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(7),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha!';
                        } else if (value.length < 6) {
                          return 'Matrícula inválida';
                        }
                        return null;
                      },
                      // validator: textController1Validator.asValidator(context),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: texSenhaController,
                      autofocus: false,
                      obscureText: !passwordVisibility,
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
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            (passwordVisibility)
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
                          return 'Senha vazia!';
                        } else if (value.length <= 6) {
                          return 'Tamanho mímino de 6 dígitos';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            unselectedWidgetColor: const Color(0xFFB3AA3D),
                          ),
                          child: Checkbox(
                            value: checkboxValue ??= false,
                            onChanged: (newValue) async {
                              setState(() => checkboxValue = newValue!);
                            },
                            activeColor: const Color(0xFFB3AA3D),
                            checkColor: const Color(0xFF070707),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                        child: Text(
                          'Lembrar senha',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFB3AA3D),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: TextButton(
                          onPressed: () {
                            //print('Apertou esqueceu a senha!!');
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFF4EC70),
                            elevation: 0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF4EC70),
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          child: const Text('Esqueceu a senha ?'),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 5),
                    child: TextButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // _formKey.currentState?.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageCa()));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Entrando...'),
                                backgroundColor: Colors.green),
                          );

                        }
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(130, 40),
                        foregroundColor: const Color(0xFFF4EC70),
                        elevation: 0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        shape: const StadiumBorder(
                            side: BorderSide(
                                color: Color(0xFFC2CC93), width: 3.5)),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFF4EC70),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Entrar'),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CadastroPage()));
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
                      child: const Text('Não possui cadastro ?'),
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
