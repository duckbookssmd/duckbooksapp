import 'package:app/pages/collection_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../flutter_flow_theme.dart';
import '../services/auth_service.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConsultPageState createState() => _ConsultPageState();
}

TextEditingController? searchController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List livros = [];

bool isLoading = false;

class _ConsultPageState extends State<ConsultPage> {
  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  String removeAccents(String str) {
    var withAccent = 'àáâãäåòóôõöøèéêëðçìíîïùúûüñšÿýž';
    var withoutAccent = 'aaaaaaooooooeeeeeciiiiuuuunsyyz';

    for (int i = 0; i < withAccent.length; i++) {
      str = str.replaceAll(withAccent[i], withoutAccent[i]);
    }
    return str;
  }

  searchByName([String name = '']) async {
    List filttedList = [];
    name = removeAccents(name.toLowerCase());

    setState(() {
      isLoading = true;
    });
    await atualizarLista();

    for (Map<String, dynamic> livro in livros) {
      if (removeAccents(livro['nome'].toLowerCase()).contains(name)) {
        filttedList.add(livro);
      }
    }

    livros = filttedList;

    setState(() {
      isLoading = false;
    });
  }

  atualizarLista() async {
    livros = await firebaseFirestore
        .collection('obra')
        .where('nome', isNull: false)
        .orderBy('nome', descending: false)
        .get()
        .then((value) {
      List lista = [];
      for (var docSnapshot in value.docs) {
        if (!(docSnapshot.data()['isDeleted'].toString() == 'true')) {
          lista.add(docSnapshot.data());
        }
      }
      return lista;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => searchByName());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: TextFormField(
                          controller: searchController,
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
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).info,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            suffixIcon: IconButton(
                              onPressed: () => searchByName(searchController?.text ?? ''),
                              icon: const Icon(Icons.search),
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                              ),
                          cursorColor: FlutterFlowTheme.of(context).secondary,
                          // validator: _model.textControllerValidator
                          //     .asValidator(context),
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              child: Text(
                                'Em Alta',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).alternate,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Container(
                                height: 100,
                                alignment: const AlignmentDirectional(0, 0),
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.developer_mode,
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  size: 24,
                                                ),
                                              ),
                                              Text(
                                                'Programação',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.palette,
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  size: 24,
                                                ),
                                              ),
                                              Text(
                                                'Design \nde Interface',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment: const AlignmentDirectional(0, 0.25),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.database,
                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Banco\nde Dados',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.auto_stories,
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  size: 24,
                                                ),
                                              ),
                                              Text(
                                                'Mangás',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.ondemand_video_rounded,
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  size: 24,
                                                ),
                                              ),
                                              Text(
                                                'Filmes',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                  child: Text(
                    'Acervo Completo',
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                          color: FlutterFlowTheme.of(context).alternate,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                        ),
                  ),
                ),
              ),
              (isLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: RefreshIndicator(
                        displacement: 10,
                        color: FlutterFlowTheme.of(context).secondary,
                        onRefresh: () => searchByName(searchController?.text ?? ''),
                        child: ListView.builder(
                          itemCount: livros.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              // substituir pelo modelo do card
                              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://picsum.photos/seed/701/600',
                                            width: 100,
                                            height: 135,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(-1, 0),
                                              child: Text(
                                                truncateWithEllipsis(30, livros[index]['nome']),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(context).titleLarge,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'Autor: ${livros[index]['autor']}',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'Ano: ${livros[index]['ano']}',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment: const AlignmentDirectional(0, 1),
                                                  child: TextButton(
                                                    onPressed: () async {},
                                                    style: OutlinedButton.styleFrom(
                                                      fixedSize: const Size(145, 40),
                                                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                      elevation: 3,
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                      shape: const StadiumBorder(
                                                          side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                    ),
                                                    child: Text(
                                                      'Pedir empréstimo',
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                            useGoogleFonts: GoogleFonts.asMap()
                                                                .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(0, 1),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 16.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Container(
                                                              width: 16,
                                                              height: 16,
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).success,
                                                                shape: BoxShape.circle,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Disponível',
                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => CollectionDetailsPage(book: livros[index]),
                                                              ),
                                                            ).whenComplete(() => searchByName(searchController?.text ?? ''));
                                                          },
                                                          style: OutlinedButton.styleFrom(
                                                            fixedSize: const Size(90, 40),
                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                            elevation: 3,
                                                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                            shape: const StadiumBorder(
                                                                side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                            // shape: ,
                                                          ),
                                                          child: Text(
                                                            'Detalhes',
                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                  useGoogleFonts: GoogleFonts.asMap()
                                                                      .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
