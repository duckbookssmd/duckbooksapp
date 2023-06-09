import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;

import 'package:flutter/material.dart';

import 'login_page.dart';


class RegisterValidationHelpPageWidget extends StatefulWidget {
  const RegisterValidationHelpPageWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterValidationHelpPageWidgetState createState() => _RegisterValidationHelpPageWidgetState();
}

class _RegisterValidationHelpPageWidgetState extends State<RegisterValidationHelpPageWidget> {

  PageController? pageViewController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => pageViewController != null && pageViewController!.hasClients && pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: PageView(
                    controller: pageViewController ??= PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0.05),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'lib/assets/images/mulhar_enduvidada.png',
                                      width: 250,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                                child: Text(
                                  '2ª Etapa - Validação de Cadastro',
                                  style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Pré- cadastro realizado.\nAgora você deve procurar\num membro do ',
                                        style: TextStyle(
                                              fontFamily: 'Jost',
                                              // color: Theme.of(context).colorScheme.primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Centro Acadêmico\npara validar seu cadastro.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                    // style: Theme.of(context).colorScheme.bodyMedium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0.05),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'lib/assets/images/mulhar_enduvidada.png',
                                      width: 250,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                                child: Text(
                                  '2ª Etapa - Validação de Cadastro',
                                  style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Para validar seu cadastro\nvocê deve apresentar \n',
                                        style: TextStyle(
                                              fontFamily: 'Jost',
                                              // color: FlutterFlowTheme.of(context).primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Atestado de Matrícula\n e documento com foto.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                    // style: FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0.05),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'lib/assets/images/mulhar_enduvidada.png',
                                      width: 250,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                                child: Text(
                                  '2ª Etapa - Validação de Cadastro',
                                  style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              const Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                  child: Text(
                                    'Após este passo você terá\nacesso as funções do aplicativo.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal 
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                      },
                                      style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(130, 40),
                                        // backgroundColor: Color(0xFFECECE9),
                                        // foregroundColor: const Color(0xFF10A375),
                                        elevation: 0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          // color: Color(0xFF10A375),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      child: const Text('Voltar ao Início'),
                                    ),
                                    // FFButtonWidget(
                                    //   onPressed: () {
                                    //     print('Button pressed ...');
                                    //   },
                                    //   text: 'Voltar ao Início',
                                    //   options: FFButtonOptions(
                                    //     height: 40,
                                    //     padding: EdgeInsetsDirectional.fromSTEB(12, 0, 1, 0),
                                    //     iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    //     color: Color(0x00D9DAC7),
                                    //     textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    //           fontFamily: 'Jost',
                                    //           color: FlutterFlowTheme.of(context).secondaryText,
                                    //           fontSize: 16,
                                    //           decoration: TextDecoration.underline,
                                    //         ),
                                    //     elevation: 0,
                                    //     borderSide: BorderSide(
                                    //       color: Color(0x00FFFFFF),
                                    //       width: 0,
                                    //     ),
                                    //     borderRadius: BorderRadius.circular(15),
                                    //   ),
                                    // ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        // color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: pageViewController ??= PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await pageViewController!.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: const smooth_page_indicator.SlideEffect(
                        spacing: 10,
                        radius: 10,
                        dotWidth: 45,
                        dotHeight: 5,
                        // dotColor: FlutterFlowTheme.of(context).accent3,
                        // activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
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
