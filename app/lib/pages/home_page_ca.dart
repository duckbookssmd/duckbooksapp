import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../flutter_flow_theme.dart';
import '../services/auth_service.dart';

class HomePageCa extends StatefulWidget {
  const HomePageCa({
    Key? key,
    this.viewType,
  }) : super(key: key);

  final List<String>? viewType;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageCaState createState() => _HomePageCaState();
}

class _HomePageCaState extends State<HomePageCa> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                              child: TextFormField(
                                // controller: _model.textController,
                                // onChanged: (_) => EasyDebounce.debounce(
                                //   '_model.textController',
                                //   Duration(milliseconds: 2000),
                                //   () => setState(() {}),
                                // ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Pesquise uma obra aqui...',
                                  labelStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 26.0,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                    ),
                                cursorColor: FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications,
                                size: 24.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    context.read<AuthService>().logout(context);
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.menu,
                                size: 24.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                              child: Text(
                                'Funções Administrativas',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).alternate,
                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: ListView(
                                    padding: const EdgeInsets.only(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          width: 96.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).alternate,
                                            borderRadius: BorderRadius.circular(5.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.clipboardCheck,
                                                color: FlutterFlowTheme.of(context).tertiary,
                                                size: 30.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Registrar\nempréstimo',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 32,
                                      ),
                                      Container(
                                        width: 96.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).alternate,
                                          borderRadius: BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle,
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              size: 32.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Adicionar\nobra',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 32,
                                      ),
                                      Container(
                                        width: 96.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).alternate,
                                          borderRadius: BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.mode_edit,
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              size: 32.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Editar\nobra',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
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
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                              child: Container(
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        width: 96.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).accent2,
                                          borderRadius: BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.userCheck,
                                                color: FlutterFlowTheme.of(context).tertiary,
                                                size: 30.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Validar\nusuário',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 32,
                                      ),
                                      Container(
                                        width: 96.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).accent2,
                                          borderRadius: BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.userLock,
                                                color: FlutterFlowTheme.of(context).tertiary,
                                                size: 30.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Inativar\nusuário',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 32,
                                      ),
                                      Container(
                                        width: 96.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).accent2,
                                          borderRadius: BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.contact_mail,
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              size: 32.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Contactar\nusuário',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                              child: Text(
                                'Histórico de Atividades',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).alternate,
                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 240.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            // child: StreamBuilder<List<EmprestimoRecord>>(
                            //   stream: queryEmprestimoRecord(),
                            //   builder: (context, snapshot) {
                            //     // Customize what your widget looks like when it's loading.
                            //     if (!snapshot.hasData) {
                            //       return Center(
                            //         child: SizedBox(
                            //           width: 50.0,
                            //           height: 50.0,
                            //           child: SpinKitFadingCircle(
                            //             color: FlutterFlowTheme.of(context)
                            //                 .accent4,
                            //             size: 50.0,
                            //           ),
                            //         ),
                            //       );
                            //     }
                            //     List<EmprestimoRecord>
                            //         dataTableEmprestimoRecordList =
                            //         snapshot.data!;
                            //     return DataTable2(
                            //       columns: [
                            //         DataColumn2(
                            //           label: DefaultTextStyle.merge(
                            //             softWrap: true,
                            //             child: Text(
                            //               'Edit Header 1',
                            //               style: FlutterFlowTheme.of(context)
                            //                   .labelLarge,
                            //             ),
                            //           ),
                            //         ),
                            //         DataColumn2(
                            //           label: DefaultTextStyle.merge(
                            //             softWrap: true,
                            //             child: Text(
                            //               'Edit Header 2',
                            //               style: FlutterFlowTheme.of(context)
                            //                   .labelLarge,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //       rows: dataTableEmprestimoRecordList
                            //           .mapIndexed((dataTableIndex,
                            //                   dataTableEmprestimoRecord) =>
                            //               [
                            //                 Text(
                            //                   'Edit Column 1',
                            //                   style:
                            //                       FlutterFlowTheme.of(context)
                            //                           .bodyMedium,
                            //                 ),
                            //                 Text(
                            //                   'Edit Column 2',
                            //                   style:
                            //                       FlutterFlowTheme.of(context)
                            //                           .bodyMedium,
                            //                 ),
                            //               ].map((c) => DataCell(c)).toList())
                            //           .map((e) => DataRow(cells: e))
                            //           .toList(),
                            //       headingRowColor: MaterialStateProperty.all(
                            //         FlutterFlowTheme.of(context).secondary,
                            //       ),
                            //       headingRowHeight: 56.0,
                            //       dataRowColor: MaterialStateProperty.all(
                            //         FlutterFlowTheme.of(context)
                            //             .secondaryBackground,
                            //       ),
                            //       dataRowHeight: 56.0,
                            //       border: TableBorder(
                            //         borderRadius: BorderRadius.circular(0.0),
                            //       ),
                            //       dividerThickness: 1.0,
                            //       showBottomBorder: true,
                            //       minWidth: 49.0,
                            //     );
                            //   },
                            // ),
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
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
  //     child: Scaffold(
  //       key: scaffoldKey,
  //       backgroundColor: const Color(0xffDFDFDF),
  //       floatingActionButton: FloatingActionButton.extended(
  //         onPressed: () async {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterBook()));
  //         },
  //         backgroundColor: const Color(0xFFCEE397),
  //         elevation: 0,
  //         label: const Row(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
  //               child: Icon(
  //                 Icons.add,
  //                 color: Color(0xFFB36E40),
  //                 size: 24,
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
  //               child: Text(
  //                 'Cadastrar',
  //                 style: TextStyle(
  //                   fontFamily: 'Jost',
  //                   color: Color(0xFFB36E40),
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       appBar: AppBar(
  //         backgroundColor: const Color(0xffDFDFDF),
  //         automaticallyImplyLeading: false,
  //         actions: [
  //           IconButton(
  //               onPressed: () {
  //                 setState(() {
  //                   context.read<AuthService>().logout(context);
  //                 });
  //               },
  //               icon: const Icon(Icons.logout))
  //         ],
  //         title: Align(
  //           alignment: const AlignmentDirectional(-1, 0),
  //           child: Image.asset(
  //             'lib/assets/images/logo_black_text_no_bg.png',
  //             width: 120,
  //             height: 46,
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         centerTitle: false,
  //         elevation: 2,
  //       ),
  //       body: SafeArea(
  //         top: true,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Column(
  //               mainAxisSize: MainAxisSize.max,
  //               children: [
  //                 const Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Align(
  //                       alignment: AlignmentDirectional(-1, 0),
  //                       child: Padding(
  //                         padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
  //                         child: Text(
  //                           'Categorias em alta',
  //                           style: TextStyle(
  //                             fontFamily: 'Jost',
  //                             color: Colors.red,
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
  //                       child: Icon(
  //                         Icons.local_fire_department_outlined,
  //                         color: Colors.red,
  //                         size: 24,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const Divider(
  //                   thickness: 1,
  //                   indent: 16,
  //                   endIndent: 30,
  //                   color: Colors.red,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
  //                   child: Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
  //                             child: Container(
  //                               width: 50,
  //                               height: 50,
  //                               clipBehavior: Clip.antiAlias,
  //                               decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Image.network(
  //                                 'https://picsum.photos/seed/795/600',
  //                                 fit: BoxFit.scaleDown,
  //                               ),
  //                             ),
  //                           ),
  //                           const Text(
  //                             'Categoria 1',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
  //                             child: Container(
  //                               width: 50,
  //                               height: 50,
  //                               clipBehavior: Clip.antiAlias,
  //                               decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Image.network(
  //                                 'https://picsum.photos/seed/486/600',
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           const Text(
  //                             'Categoria 2',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
  //                             child: Container(
  //                               width: 50,
  //                               height: 50,
  //                               clipBehavior: Clip.antiAlias,
  //                               decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Image.network(
  //                                 'https://picsum.photos/seed/684/600',
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           const Text(
  //                             'Categoria 3',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
  //                             child: Container(
  //                               width: 50,
  //                               height: 50,
  //                               clipBehavior: Clip.antiAlias,
  //                               decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Image.network(
  //                                 'https://picsum.photos/seed/209/600',
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           const Text(
  //                             'Categoria 4',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
  //                             child: Container(
  //                               width: 50,
  //                               height: 50,
  //                               clipBehavior: Clip.antiAlias,
  //                               decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Image.network(
  //                                 'https://picsum.photos/seed/493/600',
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           const Text(
  //                             'Categoria 5',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       InkWell(
  //                         onTap: () {
  //                           Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageCa()));
  //                         },
  //                         child: ElevatedButton.icon(
  //                           onPressed: null,
  //                           icon: const Icon(
  //                             Icons.admin_panel_settings,
  //                             color: Colors.black,
  //                             size: 32,
  //                           ),
  //                           label: const Text(
  //                             '',
  //                             style: TextStyle(
  //                               fontFamily: 'Jost',
  //                               color: Color(0xffDFDFDF),
  //                             ),
  //                           ),
  //                           style: ElevatedButton.styleFrom(
  //                             backgroundColor: const Color(0xFFB36E40),
  //                             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(8),
  //                             ),
  //                             elevation: 0,
  //                             side: const BorderSide(
  //                               color: Colors.transparent,
  //                               width: 1,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       InkWell(
  //                         onTap: () async {
  //                           Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageSt()));
  //                         },
  //                         child: TextButton.icon(
  //                           onPressed: null,
  //                           icon: const Icon(
  //                             Icons.person,
  //                             color: Colors.black,
  //                             size: 32,
  //                           ),
  //                           label: const Text(
  //                             '',
  //                             style: TextStyle(
  //                               fontFamily: 'Jost',
  //                               color: Color(0xffDFDFDF),
  //                             ),
  //                           ),
  //                           style: TextButton.styleFrom(
  //                             backgroundColor: Colors.transparent,
  //                             padding: const EdgeInsets.symmetric(horizontal: 24),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(8),
  //                             ),
  //                             elevation: 0,
  //                             side: const BorderSide(
  //                               color: Colors.transparent,
  //                               width: 1,
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       Align(
  //                         alignment: AlignmentDirectional(-1, 0),
  //                         child: Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
  //                           child: Text(
  //                             'Validação Pendentes',
  //                             style: TextStyle(
  //                               fontFamily: 'Jost',
  //                               color: Color(0xFFB36E40),
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Divider(
  //                     thickness: 1,
  //                     indent: 16,
  //                     endIndent: 30,
  //                     color: Color(0xffB36E40),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       Align(
  //                         alignment: AlignmentDirectional(-1, 0),
  //                         child: Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
  //                           child: Text(
  //                             'Atendimentos',
  //                             style: TextStyle(
  //                               fontFamily: 'Jost',
  //                               color: Color(0xFFB36E40),
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Divider(
  //                     thickness: 1,
  //                     indent: 16,
  //                     endIndent: 30,
  //                     color: Color(0xffB36E40),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.end,
  //                     children: [
  //                       Align(
  //                         alignment: AlignmentDirectional(-1, 0),
  //                         child: Padding(
  //                           padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
  //                           child: Text(
  //                             'Atrasos',
  //                             style: TextStyle(
  //                               fontFamily: 'Jost',
  //                               color: Color(0xFFB36E40),
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Divider(
  //                     thickness: 1,
  //                     indent: 16,
  //                     endIndent: 30,
  //                     color: Color(0xffB36E40),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
}
