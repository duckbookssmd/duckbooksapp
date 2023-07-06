// import '/flutter_flow/flutter_flow_drop_down.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/form_field_controller.dart';
// import 'package:barcode_widget/barcode_widget.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';
// import 'package:provider/provider.dart';

class RegisterLoanPageWidget extends StatefulWidget {
  const RegisterLoanPageWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterLoanPageWidgetState createState() => _RegisterLoanPageWidgetState();
}

class _RegisterLoanPageWidgetState extends State<RegisterLoanPageWidget> {
  final unfocusNode = FocusNode();

  TextEditingController? textRegistrationController;
  TextEditingController? textCodController;
  TextEditingController? emailController;
  TextEditingController? nomeObraController;
  TextEditingController? autorController;
  TextEditingController? dataDevolucaoController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');
    DateTime dataAtual = DateTime.now();
    Duration tempoEmprestado = const Duration(days: 15); // Altaerar futuramente
    DateTime dataDevolucao = dataAtual.add(tempoEmprestado);

    textRegistrationController ??= TextEditingController();
    textCodController ??= TextEditingController();
    emailController ??= TextEditingController();
    nomeObraController ??= TextEditingController();
    autorController ??= TextEditingController();
    dataDevolucaoController ??=
        TextEditingController(text: date.format(DateTime.fromMillisecondsSinceEpoch(dataDevolucao.millisecondsSinceEpoch)));
  }

  @override
  Widget build(BuildContext context) {
    setEmail({String matricula = ''}) {
      setState(() {
        // Talvez olocar um carregamento
        Provider.of<AuthService>(context, listen: false)
            .getEmailByRegistration(matricula)
            .then((value) => emailController!.text = value ?? 'Matrícula não existente no sistema');
        print(emailController!.text);
      });
    }

    setBookdata({String cod = ''}) {
      Provider.of<AuthService>(context, listen: false).getBookData(cod).then((value) {
        nomeObraController!.text = value['nome'];
        autorController!.text = value['autor'];
        // dataDevolucaoController!.text = value['nome']; Devia
      });
    }

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
          'Registrar Empréstimo',
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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: // Generated code for this Column Widget...
                Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16), // Depois tonar menos fazer responsivo
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Informações do Usuário',
                            style: FlutterFlowTheme.of(context).displayMedium,
                          ),

                          // Column(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     //   Align(
                          //     //     alignment: AlignmentDirectional(1, 0),
                          //     //     child: BarcodeWidget(
                          //     //       data: 'Barcode',
                          //     //       barcode: Barcode.qrCode(),
                          //     //       width: 32,
                          //     //       height: 32,
                          //     //       color: FlutterFlowTheme.of(context).primaryText,
                          //     //       backgroundColor: Colors.transparent,
                          //     //       errorBuilder: (_context, _error) => SizedBox(
                          //     //         width: 32,
                          //     //         height: 32,
                          //     //       ),
                          //     //       drawText: false,
                          //     //     ),
                          //     //   ),
                          //     //   Text(
                          //     //     'Ler QR Code',
                          //     //     style: FlutterFlowTheme.of(context).labelLarge.override(
                          //     //           fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                          //     //           decoration: TextDecoration.underline,
                          //     //           useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                          //     //         ),
                          //     //   ),
                          //     // ].divide(SizedBox(height: 8)),
                          //   ],
                          // ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: TextFormField(
                              controller: textRegistrationController,
                              obscureText: false,
                              onChanged: (value) {
                                if (value.length > 5) {
                                  // Pesquisar email que essa mátricula dá
                                  setEmail(matricula: value); //(Mudar as cores para indicar que ta ok)
                                }
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Matrícula/SIAPE',
                                labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                hintText: 'Matrícula/SIAPE',
                                hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
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
                                fillColor: FlutterFlowTheme.of(context).accent4,
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                  ),
                              // validator: _model.textController1Validator.asValidator(context),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: TextFormField(
                              controller: emailController,
                              enabled: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Email de Contato',
                                labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                // hintText: 'Email de Contato',
                                hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                    ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                fillColor: FlutterFlowTheme.of(context).accent4,
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                  ),
                              // validator: _model.textController2Validator.asValidator(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informações da Obra',
                            style: FlutterFlowTheme.of(context).displayMedium,
                          ),
                          const SizedBox(height: 8),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: TextFormField(
                                  controller: textCodController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Cód.',
                                    labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
                                    hintText: 'Código de registro',
                                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
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
                                    fillColor: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                      ),
                                  onChanged: (value) {
                                    if (value.length > 6) {
                                      // Pesquisar código, Decidir qual código depois
                                      setBookdata(cod: value);
                                    }
                                  },
                                  // validator: _model.textController3Validator.asValidator(context),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: TextFormField(
                                  controller: nomeObraController,
                                  obscureText: false,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Nome',
                                    labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
                                    hintText: 'Nome da obra',
                                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).primary,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
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
                                    fillColor: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                      ),
                                  // validator: _model.textController4Validator.asValidator(context),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: TextFormField(
                                  controller: autorController,
                                  obscureText: false,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Autor',
                                    labelStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
                                    hintText: 'Autor da obra',
                                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                        ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).primary,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
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
                                    fillColor: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                      ),
                                  // validator: _model.textController5Validator.asValidator(context),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Text(
                                      'Tipo',
                                      style: FlutterFlowTheme.of(context).titleLarge,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.auto_stories,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            size: 30,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Livro',
                                            style: FlutterFlowTheme.of(context).titleLarge,
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.newspaper,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.menu_book,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.movie_filter,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 8),
                                  FaIcon(
                                    FontAwesomeIcons.award,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.app_shortcut_sharp,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 30,
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informações do Empréstimo',
                        style: FlutterFlowTheme.of(context).displayMedium,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 8),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: TextFormField(
                              controller: dataDevolucaoController,
                              readOnly: true,
                              obscureText: false,
                              enabled: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Data de Devolução',
                                labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                                hintText: 'Data de Devolução',
                                hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                fillColor: FlutterFlowTheme.of(context).accent2,
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                              // validator:
                              //     _model.textController7Validator.asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () async {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(double.infinity, 60),
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                      elevation: 3,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_add,
                          color: FlutterFlowTheme.of(context).tertiaryContainer,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Finalizar empréstimo',
                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                color: FlutterFlowTheme.of(context).tertiaryContainer,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily)),
                          ),
                        ),
                      ],
                    ),
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
