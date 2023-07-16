import 'package:app/assets/theme/flutter_flow_theme.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: PageView(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1, -0.75),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          (FlutterFlowTheme.of(context)
                                                  .toString()
                                                  .contains('Dark'))
                                              ? 'lib/assets/images/logo_black_text_no_bg.png'
                                              : 'lib/assets/images/logo_to_white.png',
                                          width: 200,
                                          height: 150,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30, 250, 0, 0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Bem vindo ao Duck Books App\n\n',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          TextSpan(
                                            text:
                                                'Um app para quem sabe que ler é importante\nbuscava um aplicativo para \nfacilitar seu hábito de leitura.\n\n\n',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          TextSpan(
                                            text: 'Não serve para...\n\n',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          TextSpan(
                                            text:
                                                'quem procura um app para ler\nebooks, não é possível ler ebook por\naqui.',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          )
                                        ],
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30, 200, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.auto_stories_rounded,
                                          size: 80,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Empréstimo\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                              TextSpan(
                                                text:
                                                    'Aqui você pode solicitar o empréstimo\nde obras do acervo do centro acadêmico\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              )
                                            ],
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30, 200, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.bookmarks_rounded,
                                          size: 80,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Reservas\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                              TextSpan(
                                                text:
                                                    'Você pode também reservar\nas obras de maior interesse.\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              )
                                            ],
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30, 200, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.saved_search_rounded,
                                          size: 80,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Consulta de acervo\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                              TextSpan(
                                                text:
                                                    'Você pode também consultar o\nacervo disponível a qualquer momento\n\n',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              )
                                            ],
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 30, 0, 16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          (FlutterFlowTheme.of(context)
                                                  .toString()
                                                  .contains('Dark'))
                                              ? 'lib/assets/images/logo_black_text_no_bg.png'
                                              : 'lib/assets/images/logo_to_white.png',
                                          width: 200,
                                          height: 150,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 10, 0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                  Icons.auto_stories_rounded),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 10, 0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child:
                                                  Icon(Icons.bookmarks_rounded),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 10, 0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                  Icons.saved_search_rounded),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(30, 50, 30, 0),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPage()));
                                          },
                                          style: OutlinedButton.styleFrom(
                                            fixedSize: const Size(130, 40),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryContainer,
                                            foregroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .onPrimaryContainer,
                                            elevation: 5,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 0),
                                            textStyle: TextStyle(
                                              fontFamily: 'Jost',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimaryContainer,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          child: const Text('Entrar'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 16),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 5,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 16,
                                radius: 16,
                                dotWidth: 12,
                                dotHeight: 12,
                                dotColor: FlutterFlowTheme.of(context).accent3,
                                activeDotColor: FlutterFlowTheme.of(context)
                                    .tertiaryContainer,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
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
