import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '/assets/theme/flutter_flow_theme.dart';
import 'help_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("usuario").doc(user?.uid).get().then((value) {
      // final loggedInUser = UserModel.fromMap(value.data()); // Entendi, é para entrada automárica
      setState(() {});
    });
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  // // * Firebase Auth
  // final _auth = FirebaseAuth.instance;

  TextEditingController? texNicknameController = TextEditingController();
  TextEditingController? texMatriculaController = TextEditingController();
  TextEditingController? texEmailController = TextEditingController();
  TextEditingController? texSenhaController = TextEditingController();
  TextEditingController? texConfSenhaController = TextEditingController();
  late bool passwordVisibility1;
  late bool passwordVisibility2;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String senha;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
                  },
                  child: FaIcon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.questionCircle,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 48),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              (FlutterFlowTheme.of(context).toString().contains('Dark'))
                                  ? 'lib/assets/images/logo_black_text_no_bg.png'
                                  : 'lib/assets/images/logo_to_white.png',
                              width: 300,
                              height: 200,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: texNicknameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Apelido',
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.face_retouching_natural,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  suffixIcon: texMatriculaController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            texMatriculaController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                    ),
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo vazio';
                                  } else if (value.length < 3) {
                                    return 'Nick Muito pequeno';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: texMatriculaController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Matrícula ou SIAPE',
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.location_history_rounded,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  suffixIcon: texMatriculaController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            texMatriculaController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                    ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo vazio';
                                  } else if (value.length < 6) {
                                    return 'Matrícula inválida';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: texEmailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Email',
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.alternate_email_rounded,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  suffixIcon: texEmailController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            texEmailController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                    ),
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo vazio';
                                  } else {
                                    RegExp regexEmail = RegExp(
                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                                    return (!regexEmail.hasMatch(value)) ? 'Email invalido' : null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: texSenhaController,
                                obscureText: !passwordVisibility1,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Senha',
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility1 = !passwordVisibility1,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                cursorColor: const Color(0xFF311A0B),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Senha vazia';
                                  } else if (value.length < 6) {
                                    return 'Tamanho mímino de 6 dígitos';
                                  }
                                  senha = value;
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: texConfSenhaController,
                                obscureText: !passwordVisibility2,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Confirmação de Senha',
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 20,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility2 = !passwordVisibility2,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                cursorColor: const Color(0xFF311A0B),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Senha vazia';
                                  } else if (value.length < 6) {
                                    return 'Tamanho mímino de 6 dígitos';
                                  } else if (senha != value) {
                                    return 'Senhas diferentes!';
                                  }
                                  return null;
                                },
                              ),
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
                                if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                  context.read<AuthService>().signUp(
                                      context,
                                      texNicknameController!.text,
                                      texEmailController!.text,
                                      texSenhaController!.text,
                                      _formKey,
                                      texMatriculaController,
                                      texEmailController,
                                      texSenhaController,
                                      texConfSenhaController);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Cadastrando...'), backgroundColor: Colors.green),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 40),
                                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                // foregroundColor: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 16,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                elevation: 5,
                              ),
                              child: Text(
                                'Cadastrar',
                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                      color: FlutterFlowTheme.of(context).onPrimaryContainer,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(
                              'Já possui cadastro ?',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Faça login',
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      decoration: TextDecoration.underline,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                    ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
