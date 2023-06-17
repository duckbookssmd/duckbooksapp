import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class RegisterBook extends StatefulWidget {
  const RegisterBook({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterBookState createState() => _RegisterBookState();
}

class _RegisterBookState extends State<RegisterBook> {
  final unfocusNode = FocusNode();

  TextEditingController? textNomeController;
  TextEditingController? textAutorController;
  TextEditingController? textAnoController;
  TextEditingController? textEditionController;
  String? textType;
  String? textGenre;
  final List<String> _types = ['Livro', 'Mangá', 'Revista', 'Apostila', 'N.D.A'];
  final List<String> _genres = ['Programação', 'Design Gráfico', 'Redes', 'Tipografia', 'N.D.A'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textNomeController ??= TextEditingController();
    textAutorController ??= TextEditingController();
    textAnoController ??= TextEditingController();
    textEditionController ??= TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        backgroundColor: const Color(0xffDFDFDF),
        appBar: AppBar(
          backgroundColor: const Color(0xffDFDFDF),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Image.asset(
              'lib/assets/images/logo_black_text_no_bg.png',
              width: 120,
              height: 46,
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadastrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Jost',
                          color: Color(0xFFB36E40),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 50),
                        child: Text(
                          'Informação da Obra',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xFFB36E40),
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                child: Text(
                                  'Nome*',
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    color: Color(0xFFB36E40),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                                  child: Text(
                                    'Autor*',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      color: Color(0xFFB36E40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    controller: textNomeController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, preencha!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    controller: textAutorController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, preencha!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                child: Text(
                                  'Ano*',
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    color: Color(0xFFB36E40),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                                  child: Text(
                                    'Edição*',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      color: Color(0xFFB36E40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    controller: textAnoController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                    ),
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    controller: textEditionController,
                                    textCapitalization: TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                    ),
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
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                child: Text(
                                  'Editora*',
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    color: Color(0xFFB36E40),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(125, 0, 0, 0),
                                  child: Text(
                                    'Tipo*',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      color: Color(0xFFB36E40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    // controller: textpublisherController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true, // Editora
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, preencha!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  items: _types.map((String category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Row(
                                        children: <Widget>[
                                          Text(category),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    // do other stuff with _category
                                    setState(() => textType = newValue);
                                  },
                                  value: textType,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
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
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                child: Text(
                                  'Genero*',
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    color: Color(0xFFB36E40),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  items: _genres.map((String category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Row(
                                        children: <Widget>[
                                          Text(category),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    // do other stuff with _category
                                    setState(() => textGenre = newValue);
                                  },
                                  value: textGenre,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
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
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthService>().postBookDetailsToFirestore(
                                          textNomeController,
                                          textAutorController,
                                          textAnoController,
                                          textEditionController,
                                          textType,
                                          textGenre,
                                          // textEditoraController
                                        );
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(130, 40),
                                  backgroundColor: const Color.fromARGB(255, 64, 179, 131),
                                  elevation: 0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  shape: const StadiumBorder(side: BorderSide(color: Color.fromARGB(255, 147, 204, 155), width: 3.5)),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFB36E40),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: const Text('Cadastrar'),
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
        ),
      ),
    );
  }
}
