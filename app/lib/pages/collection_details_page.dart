import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow_theme.dart';

class CollectionDetailsPage extends StatefulWidget {
  const CollectionDetailsPage({Key? key, required this.book}) : super(key: key);
  final Map<String, dynamic> book;

  @override
  _CollectionDetailsPageState createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  late Map<String, dynamic> book;

  @override
  void initState() {
    super.initState();
    book = widget.book;
  }

  @override
  void dispose() {
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
            'Detalhes da obra',
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                  color: FlutterFlowTheme.of(context).alternate,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/725/600',
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                                child: Text(
                                  'Ver capa',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                        color: FlutterFlowTheme.of(context).info,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.arrow_right_alt,
                                color: FlutterFlowTheme.of(context).info,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Obra: ${this.book['nome']}',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        Text(
                          'Autor: ${this.book['autor']}',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Text(
                          'Ano: ${this.book['ano']}',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Text(
                          'Editora: ${this.book['editora']}',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Text(
                          'Edição: ${this.book['edicao']}ª',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Text(
                          'Tipo: ${this.book['tipo']}',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Text(
                          'Gênero: ${this.book['genero']}',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondary,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    child: Text(
                      'Previsão de Disponibilidade\n12/06/2023',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(8),
                child: TextButton(
                  onPressed: () async {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(210, 50),
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    elevation: 3,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.connect_without_contact_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Solicitar Empréstimo',
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                color: FlutterFlowTheme.of(context).tertiary,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: TextButton(
                  onPressed: () async {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(135, 40),
                    backgroundColor: FlutterFlowTheme.of(context).accent2,
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
                        Icons.bookmark_outlined,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Reservar',
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                color: FlutterFlowTheme.of(context).tertiary,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
    );
  }
}
