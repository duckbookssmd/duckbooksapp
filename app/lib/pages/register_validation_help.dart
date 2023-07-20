import 'package:app/assets/theme/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterValidationHelpPageWidget extends StatefulWidget {
  const RegisterValidationHelpPageWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterValidationHelpPageWidgetState createState() =>
      _RegisterValidationHelpPageWidgetState();
}

class _RegisterValidationHelpPageWidgetState
    extends State<RegisterValidationHelpPageWidget> {
  PageController? pageViewController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
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
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 32,
              ),
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()))),
          title: Text(
            'Dúvidas - Validação',
            style: FlutterFlowTheme.of(context).displayLarge,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'lib/assets/images/pato_enduvidado.png',
                        width: 300,
                        height: 250,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: Stack(
                        children: [
                          PageView(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '2ª Etapa - Validação de Cadastro',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge,
                                      ),
                                      const SizedBox(height: 30),
                                      Text(
                                        'Pré-cadastro realizado.\nAgora você deve procurar\num membro do Centro Acadêmico\npara validar seu cadastro.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ]),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2ª Etapa - Validação de Cadastro',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge,
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      'Para validar seu cadastro\nvocê deve apresentar\nAtestado de Matrícula\n e documento com foto.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2ª Etapa - Validação de Cadastro',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge,
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      'Após este passo você terá\nacesso as funções do aplicativo.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 8,
                                dotColor: FlutterFlowTheme.of(context).accent3,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 50),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                      child: Text(
                        'Voltar ao login',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
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
