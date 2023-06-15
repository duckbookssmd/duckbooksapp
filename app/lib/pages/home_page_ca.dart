import 'package:app/pages/home_page_student.dart';
import 'package:app/pages/register_book.dart';
import 'package:flutter/material.dart';
import 'package:app/services/auth_service.dart';
import 'package:provider/provider.dart';

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
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffDFDFDF),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterBook()));
          },
          backgroundColor: const Color(0xFFCEE397),
          elevation: 0,
          label: const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Icon(
                  Icons.add,
                  color: Color(0xFFB36E40),
                  size: 24,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    color: Color(0xFFB36E40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xffDFDFDF),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    context.read<AuthService>().logout(context);
                  });
                },
                icon: const Icon(Icons.logout))
          ],
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Image.asset(
              'lib/assets/images/logo_black_text_no_bg.png',
              width: 120,
              height: 46,
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                          child: Text(
                            'Categorias em alta',
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Icon(
                          Icons.local_fire_department_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 16,
                    endIndent: 30,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/795/600',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const Text(
                              'Categoria 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/486/600',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              'Categoria 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/684/600',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              'Categoria 3',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/209/600',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              'Categoria 4',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/493/600',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              'Categoria 5',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Jost', fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFFB36E40)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageCa()));
                          },
                          child: ElevatedButton.icon(
                            onPressed: null,
                            icon: const Icon(
                              Icons.admin_panel_settings,
                              color: Colors.black,
                              size: 32,
                            ),
                            label: const Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xffDFDFDF),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB36E40),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageSt()));
                          },
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 32,
                            ),
                            label: const Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xffDFDFDF),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                            child: Text(
                              'Validação Pendentes',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xFFB36E40),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 16,
                      endIndent: 30,
                      color: Color(0xffB36E40),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                            child: Text(
                              'Atendimentos',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xFFB36E40),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 16,
                      endIndent: 30,
                      color: Color(0xffB36E40),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                            child: Text(
                              'Atrasos',
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
                    Divider(
                      thickness: 1,
                      indent: 16,
                      endIndent: 30,
                      color: Color(0xffB36E40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
