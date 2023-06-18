import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            title: Text(
              'Início',
              style: FlutterFlowTheme.of(context).headlineLarge,
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        'Categorias em Alta',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 24.0),
                                      child: Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.developer_mode,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onContainerTertiary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Programação',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.palette,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onContainerTertiary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Design \nde Interface',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.25),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .database,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .onContainerTertiary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Banco\nde Dados',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.auto_stories,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onContainerTertiary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Mangás',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .ondemand_video_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .onContainerTertiary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Filmes',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(
                                                width: 16.0,
                                              )),
                                            ),
                                          ),
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 676.0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'C.A.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Container_ug2l6rty_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_page_view');
                                                              await _model
                                                                  .pageViewController
                                                                  ?.previousPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 32.0,
                                                              height: 16.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Leitor',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Container_cmbk06xq_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_page_view');
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 32.0,
                                                              height: 16.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4C324A4D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(SizedBox(
                                                      width: 32.0,
                                                    )),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Validações de Cadastro',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium,
                                                                      ),
                                                                      Text(
                                                                        'Ver mais',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              decoration: TextDecoration.underline,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Detalhes',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryOnSurface,
                                                                            icon:
                                                                                Icons.assignment_outlined,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'Matrícula: 524855',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Pedido em: 08/06/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .swipe,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).success,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Validar',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            icon:
                                                                                Icons.done_all_rounded,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'SIAPE: 36589895',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Pedido em: 17/06/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .fast_rewind_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).warning,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Detalhes',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryOnSurface,
                                                                            icon:
                                                                                Icons.assignment_outlined,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'Matrícula: 875894',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Pedido em: 07/03/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .fast_rewind_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      SizedBox(
                                                                    height: 8.0,
                                                                  )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Atendimentos',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium,
                                                                      ),
                                                                      Text(
                                                                        'Ver mais',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              decoration: TextDecoration.underline,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Detalhes',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryOnSurface,
                                                                            icon:
                                                                                Icons.assignment_outlined,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'Devolução',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryContainerVariant,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Realizado em: 17/06/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .fast_rewind_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryIcons,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).onContainerPrimary,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Detalhes',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryOnSurface,
                                                                            icon:
                                                                                Icons.assignment_outlined,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'Empréstimo',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryContainerVariant,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Realizado em: 17/06/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .fast_rewind_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryIcons,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).onContainerPrimary,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.25,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                'Detalhes',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryOnSurface,
                                                                            icon:
                                                                                Icons.assignment_outlined,
                                                                            onPressed:
                                                                                (_) {
                                                                              print('SlidableActionWidget pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title:
                                                                            Text(
                                                                          'Validação',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryContainerVariant,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          'Realizado em: 17/06/2023',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .fast_rewind_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryIcons,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        tileColor:
                                                                            FlutterFlowTheme.of(context).onContainerPrimary,
                                                                        dense:
                                                                            true,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      SizedBox(
                                                                    height: 8.0,
                                                                  )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Atrasos',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium,
                                                                    ),
                                                                    Text(
                                                                      'Ver mais',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'E-mail',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).infoBlue,
                                                                          icon:
                                                                              Icons.email_rounded,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Programação Shell Lin...',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Atrasado há 3 dias',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .onContainerTertiary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'E-mail',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).infoBlue,
                                                                          icon:
                                                                              Icons.email_rounded,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Estrutura de Dados',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Atrasado há 1 dias',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .onContainerTertiary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'E-mail',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).infoBlue,
                                                                          icon:
                                                                              Icons.email_rounded,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Agrupamento de comp...',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Atrasado há 10 dias',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).onContainerTertiary,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .onContainerTertiary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                  height: 8.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(
                                                  height: 16.0,
                                                )),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'C.A.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Container_b0w3uvno_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_page_view');
                                                              await _model
                                                                  .pageViewController
                                                                  ?.previousPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 32.0,
                                                              height: 16.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4C324A4D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Leitor',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Container_1xt1cugp_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_page_view');
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 32.0,
                                                              height: 16.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(SizedBox(
                                                      width: 32.0,
                                                    )),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Meus Empréstimos',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium,
                                                                    ),
                                                                    Text(
                                                                      'Ver mais',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'Renovar',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primaryOnSurface,
                                                                          icon:
                                                                              Icons.repeat_rounded,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Livro 1',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Devolução: 31/06/2023',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'Renovar',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primaryOnSurface,
                                                                          icon:
                                                                              Icons.repeat_rounded,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Livro 2',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Devolução: 17/06/2023',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .warning,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Slidable(
                                                                    endActionPane:
                                                                        ActionPane(
                                                                      motion:
                                                                          const ScrollMotion(),
                                                                      extentRatio:
                                                                          0.25,
                                                                      children: [
                                                                        SlidableAction(
                                                                          label:
                                                                              'Devolver',
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).warning,
                                                                          icon:
                                                                              Icons.camera_alt,
                                                                          onPressed:
                                                                              (_) {
                                                                            print('SlidableActionWidget pressed ...');
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Livro 3',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        'Devolução: 07/03/2023',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .fast_rewind_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      dense:
                                                                          true,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                  height: 8.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Reservas',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium,
                                                                  ),
                                                                  Text(
                                                                    'Ver mais',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Slidable(
                                                                  endActionPane:
                                                                      ActionPane(
                                                                    motion:
                                                                        const ScrollMotion(),
                                                                    extentRatio:
                                                                        0.25,
                                                                    children: [
                                                                      SlidableAction(
                                                                        label:
                                                                            'Cancelar',
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                        icon: Icons
                                                                            .clear_rounded,
                                                                        onPressed:
                                                                            (_) {
                                                                          print(
                                                                              'SlidableActionWidget pressed ...');
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      'Livro 1',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      'Devolução: 17/06/2023',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .fast_rewind_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    dense: true,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Slidable(
                                                                  endActionPane:
                                                                      ActionPane(
                                                                    motion:
                                                                        const ScrollMotion(),
                                                                    extentRatio:
                                                                        0.25,
                                                                    children: [
                                                                      SlidableAction(
                                                                        label:
                                                                            'Cancelar',
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                        icon: Icons
                                                                            .clear_rounded,
                                                                        onPressed:
                                                                            (_) {
                                                                          print(
                                                                              'SlidableActionWidget pressed ...');
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      'Livro 2',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      'Devolução: 17/06/2023',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .fast_rewind_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    dense: true,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Slidable(
                                                                  endActionPane:
                                                                      ActionPane(
                                                                    motion:
                                                                        const ScrollMotion(),
                                                                    extentRatio:
                                                                        0.25,
                                                                    children: [
                                                                      SlidableAction(
                                                                        label:
                                                                            'Cancelar',
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                        icon: Icons
                                                                            .clear_rounded,
                                                                        onPressed:
                                                                            (_) {
                                                                          print(
                                                                              'SlidableActionWidget pressed ...');
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      'Livro 3',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      'Devolução: 17/06/2023',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .fast_rewind_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    tileColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    dense: true,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                height: 8.0,
                                                              )),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
