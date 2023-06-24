import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../flutter_flow_theme.dart';
import '../services/auth_service.dart';

class RegisterBook extends StatefulWidget {
  const RegisterBook({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterBookState createState() => _RegisterBookState();
}

class _RegisterBookState extends State<RegisterBook> {
  final unfocusNode = FocusNode();

  TextEditingController? textCodController;
  TextEditingController? textNomeController;
  TextEditingController? textAutorController;
  TextEditingController? textPublisherController;
  TextEditingController? textAnoController;
  TextEditingController? textEditionController;
  String? textType;
  String? textGenre;
  final List<String> _types = ['Livro', 'Mangá/Gibi', 'DVD', 'Periódico(Artigo)', 'Revista', 'N.D.A'];
  final List<String> _genres = ['Programação', 'Design Gráfico', 'Redes', 'Tipografia', 'N.D.A'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textCodController ??= TextEditingController();
    textNomeController ??= TextEditingController();
    textAutorController ??= TextEditingController();
    textPublisherController ??= TextEditingController();
    textAnoController ??= TextEditingController();
    textEditionController ??= TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
            color: FlutterFlowTheme.of(context).accent3,
          ),
        ),
        title: Text(
          'Cadastrar Obra',
          style: FlutterFlowTheme.of(context).displayLarge.override(
                fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                color: FlutterFlowTheme.of(context).alternate,
                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'Informações da Obra',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                        color: FlutterFlowTheme.of(context).alternate,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                      ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            controller: textCodController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Cód.',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Cód.',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // Só numeros / nó maximo 7 dígitos
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textNomeController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Nome',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Nome',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textAutorController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Autor',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Autor',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textPublisherController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Editora',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Editora',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textEditionController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Edição',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Edição',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // Só numeros / nó maximo 7 dígitos
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textAnoController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Ano',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Ano',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // Só numeros / nó maximo 7 dígitos
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              } else if (value.length < 4) {
                                return 'Ano inválido';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.069,
                              child: DropdownButtonFormField(
                                items: _types.map((String category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          category,
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  // do other stuff with _category
                                  setState(() => textType = newValue);
                                },
                                value: textType,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                                decoration: InputDecoration(
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  label: const Text('Tipo'),
                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Selecione um Tipo!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.069,
                              child: DropdownButtonFormField(
                                items: _genres.map((String category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          category,
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  // do other stuff with _category
                                  setState(() => textGenre = newValue);
                                },
                                value: textGenre,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                  label: const Text('Gênero'),
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Selecione um Gênero!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var confirmDialogResponse = await showDialog<bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Confirmar cadastro'),
                                          content: const Text('Deseja finalizar o cadastro dessa obra ?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                              child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                              child: const Text('Confirmar'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  context.read<AuthService>().postBookDetailsToFirestore(
                                        textNomeController,
                                        textAutorController,
                                        textAnoController,
                                        textEditionController,
                                        textType,
                                        textGenre,
                                        textPublisherController,
                                        false
                                      );
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(130, 40),
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                              elevation: 3,
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text(
                              'Cadastrar obra',
                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                    color: Colors.white,
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                  ),
                            ),
                          ),
                          // child: FFButtonWidget(
                          //   onPressed: () async {
                          //     logFirebaseEvent(
                          //         'REGISTER_BOOK_CADASTRAR_OBRA_BTN_ON_TAP');
                          //     logFirebaseEvent('Button_alert_dialog');
                          //     var confirmDialogResponse = await showDialog<bool>(
                          //           context: context,
                          //           builder: (alertDialogContext) {
                          //             return AlertDialog(
                          //               title: Text('Confirmar cadastro'),
                          //               content: Text(
                          //                   'Deseja finalizar o cadastro dessa obra ?'),
                          //               actions: [
                          //                 TextButton(
                          //                   onPressed: () => Navigator.pop(
                          //                       alertDialogContext, false),
                          //                   child: Text('Cancelar'),
                          //                 ),
                          //                 TextButton(
                          //                   onPressed: () => Navigator.pop(
                          //                       alertDialogContext, true),
                          //                   child: Text('Confirmar'),
                          //                 ),
                          //               ],
                          //             );
                          //           },
                          //         ) ??
                          //         false;
                          //   },
                          //   text: 'Cadastrar obra',
                          //   options: FFButtonOptions(
                          //     height: 40,
                          //     padding:
                          //         EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          //     iconPadding:
                          //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          //     color: FlutterFlowTheme.of(context).alternate,
                          //     textStyle: FlutterFlowTheme.of(context)
                          //         .titleSmall
                          //         .override(
                          //           fontFamily: FlutterFlowTheme.of(context)
                          //               .titleSmallFamily,
                          //           color: Colors.white,
                          //           useGoogleFonts: GoogleFonts.asMap()
                          //               .containsKey(FlutterFlowTheme.of(context)
                          //                   .titleSmallFamily),
                          //         ),
                          //     elevation: 3,
                          //     borderSide: BorderSide(
                          //       color: Colors.transparent,
                          //       width: 1,
                          //     ),
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                    // (SizedBox(
                    //   height: 8,
                    // )
                    // ),
                  ),
                ),
              ),
            ],
            // (SizedBox(
            //   height: 8,
            // )
            // ),
          ),
        ),
      ),
    );
  }
}
  //   return GestureDetector(
  //     onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
  //     child: Scaffold(
  //       backgroundColor: const Color(0xffDFDFDF),
  //       appBar: AppBar(
  //         backgroundColor: const Color(0xffDFDFDF),
  //         automaticallyImplyLeading: true,
  //         title: Align(
  //           alignment: const AlignmentDirectional(-1, 0),
  //           child: Image.asset(
  //             'lib/assets/images/logo_black_text_no_bg.png',
  //             width: 120,
  //             height: 46,
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         centerTitle: true,
  //         elevation: 0,
  //       ),
  //       body: SafeArea(
  //         top: true,
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               const Align(
  //                 alignment: AlignmentDirectional(0, -1),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Cadastrar',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontFamily: 'Jost',
  //                         color: Color(0xFFB36E40),
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.w900,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Align(
  //                     alignment: AlignmentDirectional(-1, 0),
  //                     child: Padding(
  //                       padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 50),
  //                       child: Text(
  //                         'Informação da Obra',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           fontFamily: 'Jost',
  //                           color: Color(0xFFB36E40),
  //                           fontSize: 24,
  //                           fontWeight: FontWeight.w900,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Form(
  //                 key: _formKey,
  //                 child: Column(
  //                   children: [
  //                     const Align(
  //                       alignment: AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Padding(
  //                               padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
  //                               child: Text(
  //                                 'Nome*',
  //                                 style: TextStyle(
  //                                   fontFamily: 'Jost',
  //                                   color: Color(0xFFB36E40),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ),
  //                             Align(
  //                               alignment: AlignmentDirectional(1, 0),
  //                               child: Padding(
  //                                 padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
  //                                 child: Text(
  //                                   'Autor*',
  //                                   style: TextStyle(
  //                                     fontFamily: 'Jost',
  //                                     color: Color(0xFFB36E40),
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.w500,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Align(
  //                       alignment: const AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
  //                                 child: TextFormField(
  //                                   controller: textNomeController,
  //                                   obscureText: false,
  //                                   decoration: InputDecoration(
  //                                     isDense: true,
  //                                     enabledBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     errorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedErrorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     filled: true,
  //                                   ),
  //                                   validator: (value) {
  //                                     if (value == null || value.isEmpty) {
  //                                       return 'Por favor, preencha!';
  //                                     }
  //                                     return null;
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
  //                                 child: TextFormField(
  //                                   controller: textAutorController,
  //                                   obscureText: false,
  //                                   decoration: InputDecoration(
  //                                     isDense: true,
  //                                     enabledBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     errorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedErrorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(
  //                                         width: 2,
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     filled: true,
  //                                   ),
  //                                   validator: (value) {
  //                                     if (value == null || value.isEmpty) {
  //                                       return 'Por favor, preencha!';
  //                                     }
  //                                     return null;
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     const Align(
  //                       alignment: AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Padding(
  //                               padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
  //                               child: Text(
  //                                 'Ano*',
  //                                 style: TextStyle(
  //                                   fontFamily: 'Jost',
  //                                   color: Color(0xFFB36E40),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ),
  //                             Align(
  //                               alignment: AlignmentDirectional(1, 0),
  //                               child: Padding(
  //                                 padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
  //                                 child: Text(
  //                                   'Edição*',
  //                                   style: TextStyle(
  //                                     fontFamily: 'Jost',
  //                                     color: Color(0xFFB36E40),
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.w500,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Align(
  //                       alignment: const AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
  //                                 child: TextFormField(
  //                                   controller: textAnoController,
  //                                   obscureText: false,
  //                                   decoration: InputDecoration(
  //                                     isDense: true,
  //                                     enabledBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     errorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedErrorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     filled: true,
  //                                   ),
  //                                   keyboardType: TextInputType.number,
  //                                   inputFormatters: <TextInputFormatter>[
  //                                     // Só numeros / nó maximo 7 dígitos
  //                                     FilteringTextInputFormatter.digitsOnly,
  //                                     LengthLimitingTextInputFormatter(4),
  //                                   ],
  //                                   validator: (value) {
  //                                     if (value == null || value.isEmpty) {
  //                                       return 'Por favor, preencha!';
  //                                     } else if (value.length < 4) {
  //                                       return 'Ano inválido';
  //                                     }
  //                                     return null;
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
  //                                 child: TextFormField(
  //                                   controller: textEditionController,
  //                                   textCapitalization: TextCapitalization.words,
  //                                   obscureText: false,
  //                                   decoration: InputDecoration(
  //                                     isDense: true,
  //                                     enabledBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     errorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedErrorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     filled: true,
  //                                   ),
  //                                   keyboardType: TextInputType.number,
  //                                   inputFormatters: <TextInputFormatter>[
  //                                     // Só numeros / nó maximo 7 dígitos
  //                                     FilteringTextInputFormatter.digitsOnly,
  //                                   ],
  //                                   validator: (value) {
  //                                     if (value == null || value.isEmpty) {
  //                                       return 'Por favor, preencha!';
  //                                     }
  //                                     return null;
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     const Align(
  //                       alignment: AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Padding(
  //                               padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
  //                               child: Text(
  //                                 'Editora*',
  //                                 style: TextStyle(
  //                                   fontFamily: 'Jost',
  //                                   color: Color(0xFFB36E40),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ),
  //                             Align(
  //                               alignment: AlignmentDirectional(1, 0),
  //                               child: Padding(
  //                                 padding: EdgeInsetsDirectional.fromSTEB(125, 0, 0, 0),
  //                                 child: Text(
  //                                   'Tipo*',
  //                                   style: TextStyle(
  //                                     fontFamily: 'Jost',
  //                                     color: Color(0xFFB36E40),
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.w500,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Align(
  //                       alignment: const AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
  //                                 child: TextFormField(
  //                                   // controller: textpublisherController,
  //                                   obscureText: false,
  //                                   decoration: InputDecoration(
  //                                     isDense: true,
  //                                     enabledBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     errorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     focusedErrorBorder: UnderlineInputBorder(
  //                                       borderSide: const BorderSide(),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     filled: true, // Editora
  //                                   ),
  //                                   validator: (value) {
  //                                     if (value == null || value.isEmpty) {
  //                                       return 'Por favor, preencha!';
  //                                     }
  //                                     return null;
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: DropdownButtonFormField(
  //                                 items: _types.map((String category) {
  //                                   return DropdownMenuItem(
  //                                     value: category,
  //                                     child: Row(
  //                                       children: <Widget>[
  //                                         Text(category),
  //                                       ],
  //                                     ),
  //                                   );
  //                                 }).toList(),
  //                                 onChanged: (newValue) {
  //                                   // do other stuff with _category
  //                                   setState(() => textType = newValue);
  //                                 },
  //                                 value: textType,
  //                                 decoration: InputDecoration(
  //                                   isDense: true,
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   errorBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   focusedErrorBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   filled: true,
  //                                 ),
  //                                 validator: (value) {
  //                                   if (value == null) {
  //                                     return 'Selecione um Tipo!';
  //                                   }
  //                                   return null;
  //                                 },
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     const Align(
  //                       alignment: AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Padding(
  //                               padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
  //                               child: Text(
  //                                 'Genero*',
  //                                 style: TextStyle(
  //                                   fontFamily: 'Jost',
  //                                   color: Color(0xFFB36E40),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Align(
  //                       alignment: const AlignmentDirectional(0, 0),
  //                       child: Padding(
  //                         padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.max,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Expanded(
  //                               child: DropdownButtonFormField(
  //                                 items: _genres.map((String category) {
  //                                   return DropdownMenuItem(
  //                                     value: category,
  //                                     child: Row(
  //                                       children: <Widget>[
  //                                         Text(category),
  //                                       ],
  //                                     ),
  //                                   );
  //                                 }).toList(),
  //                                 onChanged: (newValue) {
  //                                   // do other stuff with _category
  //                                   setState(() => textGenre = newValue);
  //                                 },
  //                                 value: textGenre,
  //                                 decoration: InputDecoration(
  //                                   isDense: true,
  //                                   enabledBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   focusedBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   errorBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   focusedErrorBorder: UnderlineInputBorder(
  //                                     borderSide: const BorderSide(),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   filled: true,
  //                                 ),
  //                                 validator: (value) {
  //                                   if (value == null) {
  //                                     return 'Selecione um Tipo!';
  //                                   }
  //                                   return null;
  //                                 },
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisSize: MainAxisSize.max,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Align(
  //                           alignment: const AlignmentDirectional(0, 0),
  //                           child: Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
  //                             child: TextButton(
  //                               onPressed: () {
  //                                 if (_formKey.currentState!.validate()) {
  //                                   context.read<AuthService>().postBookDetailsToFirestore(
  //                                         textNomeController,
  //                                         textAutorController,
  //                                         textAnoController,
  //                                         textEditionController,
  //                                         textType,
  //                                         textGenre,
  //                                         // textEditoraController
  //                                       );
  //                                 }
  //                               },
  //                               style: OutlinedButton.styleFrom(
  //                                 fixedSize: const Size(130, 40),
  //                                 backgroundColor: const Color.fromARGB(255, 64, 179, 131),
  //                                 elevation: 0,
  //                                 padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
  //                                 shape: const StadiumBorder(side: BorderSide(color: Color.fromARGB(255, 147, 204, 155), width: 3.5)),
  //                                 textStyle: const TextStyle(
  //                                   fontFamily: 'Poppins',
  //                                   color: Color(0xFFB36E40),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                               ),
  //                               child: const Text('Cadastrar'),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
    // );
//   }
// }
