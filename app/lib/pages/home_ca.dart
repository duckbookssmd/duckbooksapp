import 'package:app/pages/loan_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../flutter_flow_theme.dart';
import 'consult_colletion_page.dart';
import 'home_page_ca.dart';

class HomeCa extends StatefulWidget {
  const HomeCa({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeCaState createState() => _HomeCaState();
}

class _HomeCaState extends State<HomeCa> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          HomePageCa(),
          LoanPage(),
          ConsultPage(),
          ConsultPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        onTap: (page) => setState(
          () {
            pc.jumpToPage(page);
            // pc.animateToPage(
            //   page,
            //   duration: const Duration(milliseconds: 50),
            //   curve: Curves.ease,
            // );
          },
        ),
        backgroundColor: FlutterFlowTheme.of(context).accent2,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).primaryBackground, // tertiary
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20.0,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24.0,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 22.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 28.0,
            ),
            label: 'Empréstimos',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmarks,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.bookmarks,
              size: 30.0,
            ),
            label: 'Reservas',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.searchengin,
              size: 24.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.searchengin,
              size: 28.0,
            ),
            label: 'Consulta',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
