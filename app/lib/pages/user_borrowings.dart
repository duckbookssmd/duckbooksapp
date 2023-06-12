import 'package:app/pages/home_page_ca.dart';
import 'package:flutter/material.dart';

import 'home_page_student.dart';


class UserBorrowings extends StatefulWidget {
  const UserBorrowings({
    Key? key,
    String? viewType,
  })  : viewType = viewType ?? 'Utilizador',
        super(key: key);

  final String viewType;

  @override
  // ignore: library_private_types_in_public_api
  _UserBorrowingsState createState() => _UserBorrowingsState();
}

class _UserBorrowingsState extends State<UserBorrowings> {

  final unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffDFDFDF),
        appBar: AppBar(
          backgroundColor: const Color(0xffDFDFDF),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF4C605D),
              size: 30,
            ),
            onPressed: () async {
              
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/assets/images/logo_black_text_no_bg.png',
                  width: 120,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
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
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB36E40)
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB36E40)
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB36E40)
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB36E40)
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB36E40)
                              ),
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
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageCa()));
                          },
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(
                              Icons.admin_panel_settings,
                              color: Colors.black,
                              size: 32,
                            ),
                            label: const Text(''),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0x00b36e40),
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
                            label: const Text(''),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0x00b36e40),
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
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                            child: Text(
                              'Meus Empréstimos',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xFFB36E40),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1, 0),
                          child: TextButton.icon(
                            onPressed: () {
                              //print('Button pressed ...');
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                            label: const Text(
                              'Ver mais',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0xFFB36E40),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsetsDirectional.fromSTEB(100, 10, 0, 0),
                              backgroundColor: const Color(0x00FFFFFF),
                              elevation: 0,
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 16,
                      endIndent: 30,
                      color: Color(0xFFB36E40),
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
