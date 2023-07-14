import 'package:app/pages/collection_details_page.dart';
import 'package:app/pages/consultion_genre_page.dart';
import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/assets/theme/flutter_flow_theme.dart';
import '../widgets/duck_app_bar.dart';
import 'borrow_solicitations_page.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        .collection('book')
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
    List generos = context.read<AuthService>().genreList;

    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        key: scaffoldKey,
        drawer: DuckAppBar(
          scaffoldKey: scaffoldKey,
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          elevation: 2,
          leading: IconButton(
            onPressed: () {
              setState(
                () {
                  scaffoldKey.currentState!.openDrawer();
                },
              );
            },
            icon: Icon(
              Icons.menu,
              size: 24.0,
              color: FlutterFlowTheme.of(context).onBackground,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BorrowSolicitationsPage()));
              },
              icon: Badge(
                textColor: FlutterFlowTheme.of(context).onPrimaryContainer,
                backgroundColor: FlutterFlowTheme.of(context).primaryContainer,
                largeSize: 20,
                smallSize: 20,
                label: Text('!'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 4.0),
                  child: Icon(
                    Icons.notifications,
                    size: 24.0,
                    color: FlutterFlowTheme.of(context).onBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Expanded(
                              child: TextFormField(
                                controller: searchController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Pesquise uma obra aqui...',
                                  labelStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
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
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                    ),
                                cursorColor: FlutterFlowTheme.of(context).tertiary,
                                // validator: _model.textControllerValidator
                                //     .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Text(
                                'Em Alta',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).onBackground,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                            child: Container(
                              height: 140,
                              alignment: const AlignmentDirectional(0, 0),
                              child: Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  child: ListView.builder(
                                      itemCount: generos.length,
                                      scrollDirection: axisDirectionToAxis(AxisDirection.left),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => ConsultionGenrePage(genre: generos[index]),
                                                  ),
                                                ).whenComplete(() => searchByName(searchController?.text ?? '')),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/613/600',
                                                        width: MediaQuery.sizeOf(context).width * 0.25,
                                                        height: 120,
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 120,
                                                      width: MediaQuery.sizeOf(context).width * 0.25,
                                                      alignment: AlignmentDirectional.bottomStart,
                                                      child: Text(
                                                        truncateWithEllipsis(22, generos[index]),
                                                        textAlign: TextAlign.start,
                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                              color: FlutterFlowTheme.of(context).info,
                                                              letterSpacing: 1,
                                                              useGoogleFonts: GoogleFonts.asMap()
                                                                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                              lineHeight: 1.2,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'Acervo Completo',
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                          color: FlutterFlowTheme.of(context).onBackground,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                                  truncateWithEllipsis(25, livros[index]['nome']),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  'Autor: ${truncateWithEllipsis(28, livros[index]['autor'])}',
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment: const AlignmentDirectional(-1, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        (livros[index]['userloan'].toString() == 'null')
                                                            ? Row(
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
                                                                  SizedBox(width: 8),
                                                                  Text(
                                                                    'Disponível',
                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                  ),
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
                                                                  SizedBox(width: 8),
                                                                  Text(
                                                                    'Indisponível',
                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                        Align(
                                                          alignment: const AlignmentDirectional(-1, 0),
                                                          child: TextButton(
                                                            onPressed: () async {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      CollectionDetailsPage(book: livros[index]),
                                                                ),
                                                              ).whenComplete(() => searchByName(searchController?.text ?? ''));
                                                            },
                                                            style: OutlinedButton.styleFrom(
                                                              fixedSize: const Size(90, 40),
                                                              backgroundColor: FlutterFlowTheme.of(context).tertiaryContainer,
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
                                                                    color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                                        FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
