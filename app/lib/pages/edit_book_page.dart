import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/assets/theme/flutter_flow_theme.dart';
import '../services/auth_service.dart';

class EditBookPage extends StatefulWidget {
  const EditBookPage({Key? key, required this.book}) : super(key: key);
  final Map<String, dynamic> book;
  @override
  // ignore: library_private_types_in_public_api
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  late Map<String, dynamic> book;

  setBookData() {
    textCodController = TextEditingController(text: book['isbn'] ?? '');
    textNomeController = TextEditingController(text: book['nome'] ?? '');
    textAutorController = TextEditingController(text: book['autor'] ?? '');
    textPublisherController = TextEditingController(text: book['editora'] ?? '');
    textAnoController = TextEditingController(text: book['ano'].toString());
    textEditionController = TextEditingController(text: book['edicao'].toString());
    textDateController = TextEditingController(text: book['dataCadastro']);
    textType = (_types.contains(book['tipo'])) ? book['tipo'] : null;
    textGenre = (_genres.contains(book['genero'])) ? book['genero'] : null;
  }

  TextEditingController? textCodController;
  TextEditingController? textNomeController;
  TextEditingController? textAutorController;
  TextEditingController? textPublisherController;
  TextEditingController? textAnoController;
  TextEditingController? textEditionController;
  TextEditingController? textDateController;
  String? textType;
  String? textGenre;
  final List<String> _types = ['Livro', 'Mangá/Gibi', 'DVD', 'Periódico(Artigo)', 'Revista', 'design', 'N.D.A'];
  late List<String> _genres;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    book = widget.book;
    _genres = context.read<AuthService>().genreList;
    SchedulerBinding.instance.addPostFrameCallback((s) {
      setBookData();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        title: Text(
          'Editar Obra',
          style: FlutterFlowTheme.of(context).displayLarge.override(
                fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                color: FlutterFlowTheme.of(context).onBackground,
                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                child: Text(
                  'Informações da Obra',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                        color: FlutterFlowTheme.of(context).alternate,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                      ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textCodController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              fillColor: FlutterFlowTheme.of(context).accent4,
                              isDense: true,
                              labelText: 'Cód.',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Cód.',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textNomeController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Nome',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Nome',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              suffixIcon: Icon(
                                Icons.edit_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textAutorController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Autor',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Autor',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              suffixIcon: Icon(
                                Icons.edit_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textPublisherController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Editora',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Editora',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              suffixIcon: Icon(
                                Icons.edit_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textEditionController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Edição',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Edição',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              suffixIcon: Icon(
                                Icons.edit_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // Só numeros / nó maximo 7 dígitos
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.91,
                          child: TextFormField(
                            controller: textAnoController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Ano',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Ano',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              suffixIcon: Icon(
                                Icons.edit_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // Só numeros / nó maximo 7 dígitos
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha!';
                              } else if (value.length < 4) {
                                return 'Ano inválido';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.069,
                              child: DropdownButtonFormField(
                                items: _types.map((String category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          category,
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  // do other stuff with _category
                                  setState(() => textType = newValue);
                                },
                                value: textType,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                                decoration: InputDecoration(
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  label: const Text('Tipo'),
                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Selecione um Tipo!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.50,
                              height: MediaQuery.of(context).size.height * 0.069,
                              child: DropdownButtonFormField(
                                items: _genres.map((String category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          category,
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  // do other stuff with _category
                                  setState(() => textGenre = newValue);
                                },
                                value: textGenre,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                  label: const Text('Gênero'),
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Selecione um Gênero!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: textDateController,
                            autofocus: false,
                            enabled: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Data de Cadastro',
                              labelStyle: FlutterFlowTheme.of(context).labelMedium,
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.2),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                              child: TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var confirmDialogResponse = await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Confirmar edição'),
                                              content: const Text('Deseja alterar os dados dessa obra ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                  child: const Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                  child: const Text('Confirmar'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                    if (confirmDialogResponse) {
                                      context.read<AuthService>().postBookDetailsToFirestore(
                                            textCodController,
                                            textNomeController,
                                            textAutorController,
                                            textAnoController,
                                            textEditionController,
                                            textType,
                                            textGenre,
                                            textPublisherController,
                                            true,
                                          );
                                    }
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fixedSize: const Size(double.infinity, 60),
                                  backgroundColor: FlutterFlowTheme.of(context).secondaryContainer,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit_outlined,
                                      color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Salvar alterações',
                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                            fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                            color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                            useGoogleFonts:
                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              child: TextButton(
                                onPressed: () async {
                                  var confirmDialogResponse = await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Confirmar exclusão'),
                                            content: const Text('Deseja apagar os dados dessa obra ?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                child: const Text('Confirmar'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    await context.read<AuthService>().deleteBook(book);
                                  }
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fixedSize: const Size(double.infinity, 60),
                                  backgroundColor: FlutterFlowTheme.of(context).errorContainer,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete_forever_rounded,
                                      color: FlutterFlowTheme.of(context).onErrorContainer,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Excluir obra',
                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                            fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                            color: FlutterFlowTheme.of(context).onErrorContainer,
                                            useGoogleFonts:
                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily)),
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
