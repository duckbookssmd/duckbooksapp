import 'package:app/assets/theme/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/string_utils.dart';
import 'collection_details_page.dart';

class ConsultionGenrePage extends StatefulWidget {
  const ConsultionGenrePage({Key? key, required this.genre}) : super(key: key);
  final String genre;
  @override
  // ignore: library_private_types_in_public_api
  _ConsultionGenrePageState createState() => _ConsultionGenrePageState();
}

TextEditingController? searchController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List livros = [];

bool isLoading = false;

String genre = 'Redes';

class _ConsultionGenrePageState extends State<ConsultionGenrePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// Pesquisa por livros que dentro do banco de dados e atualiza a lista de livros.
  ///
  /// Cria uma lista filtrada a partir dos livros da lista atualizada que possuam a [name] em seus nomes.
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

  /// Atualiza a lista de livros não deletados e com o [genre] escolhido presentes no com o Firestore.
  atualizarLista() async {
    livros = await firebaseFirestore.collection('book').orderBy('nome', descending: false).get().then((value) {
      List lista = [];
      for (var docSnapshot in value.docs) {
        if (!(docSnapshot.data()['isDeleted'].toString() == 'true') && docSnapshot.data()['genero'] == genre) {
          lista.add(docSnapshot.data());
        }
      }
      return lista;
    });
  }

  @override
  void initState() {
    super.initState();
    genre = widget.genre;
    WidgetsBinding.instance.addPostFrameCallback((_) => searchByName());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        key: scaffoldKey,
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
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ),
          title: Text(
            genre,
            style: FlutterFlowTheme.of(context).displayLarge,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                        icon: const Icon(
                          Icons.search,
                          size: 26,
                        ),
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
              (isLoading)
                  ? Center(
                      child: Image.asset(
                        'lib/assets/images/pato_girando.gif',
                        width: 150,
                      ),
                    )
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CollectionDetailsPage(book: livros[index]),
                                            ),
                                          ).whenComplete(() => searchByName(searchController?.text ?? '')),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.network(
                                              (livros[index]['foto'] == 'Colocar' || livros[index]['foto'] == 'null')
                                                  ? 'https://picsum.photos/id/24/367/267'
                                                  : livros[index]['foto'],
                                              width: 100,
                                              height: 135,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Align(
                                      alignment: const AlignmentDirectional(-1, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(-1, 0),
                                            child: Text(
                                              truncateWithEllipsis(19, livros[index]['nome']),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(context).headlineLarge,
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(-1, 0),
                                            child: Text(
                                              'Autor: ${truncateWithEllipsis(20, livros[index]['autor'])}',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(context).titleLarge,
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(-1, 0),
                                            child: Text(
                                              'Ano: ${livros[index]['ano']}',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(context).titleLarge,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              (livros[index]['userloan'].toString() == 'null')
                                                  ? Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: 16,
                                                          height: 16,
                                                          decoration: BoxDecoration(
                                                            color: FlutterFlowTheme.of(context).success,
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          'Disponível',
                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                        ),
                                                        const SizedBox(width: 32),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 16,
                                                          height: 16,
                                                          decoration: BoxDecoration(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          'Indisponível',
                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                        ),
                                                        const SizedBox(width: 23),
                                                      ],
                                                    ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 16.0,
                                                ),
                                                child: TextButton(
                                                  onPressed: () async {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CollectionDetailsPage(book: livros[index]),
                                                      ),
                                                    ).whenComplete(() => searchByName(searchController?.text ?? ''));
                                                  },
                                                  style: OutlinedButton.styleFrom(
                                                    fixedSize: const Size(120, 40),
                                                    backgroundColor: FlutterFlowTheme.of(context).tertiaryContainer,
                                                    elevation: 3,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                    shape: const StadiumBorder(
                                                        side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                    // shape: ,
                                                  ),
                                                  child: Text(
                                                    'Detalhes',
                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                          fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                          color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                          useGoogleFonts: GoogleFonts.asMap()
                                                              .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
