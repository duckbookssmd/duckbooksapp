import 'package:app/pages/Reservations_page.dart';
import 'package:app/pages/loan_page.dart';
// import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

import '/assets/theme/flutter_flow_theme.dart';
import 'consult_colletion_page.dart';

class HomeFinalUse extends StatefulWidget {
  const HomeFinalUse({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeFinalUseState createState() => _HomeFinalUseState();
}

class _HomeFinalUseState extends State<HomeFinalUse> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   // Se o USUARIO não tiver nickname, Fazer popup para atribuir um
    //   // print(Provider.of<AuthService>(context, listen: false).nickname);
    //   // Checar se ele tem ou não
    //   if (Provider.of<AuthService>(context, listen: false).nickname == null) {
    //     return showDialog<void>(
    //       context: context, //fazer ser obrigatio no futuro
          
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: const Text('Basic dialog title'),
    //           content: Column(
    //             children: [
    //               const Text(
    //                 'A dialog is a type of modal window that\n'
    //                 'appears in front of app content to\n'
    //                 'provide critical information, or prompt\n'
    //                 'for a decision to be made.',
    //               ),
    //               TextFormField(),
    //             ],
    //           ),
    //           actions: <Widget>[
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 textStyle: Theme.of(context).textTheme.labelLarge,
    //               ),
    //               child: const Text('Disable'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //             TextButton(
    //               style: TextButton.styleFrom(
    //                 textStyle: Theme.of(context).textTheme.labelLarge,
    //               ),
    //               child: const Text('Enable'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ],
    //         );
    //       },
    //     );
    //   }
    //   // POP up
    //   // Atribuir
    // });
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
          ConsultPage(),
          LoanPage(),
          ReservationsPage(),
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
        ],
      ),
    );
  }
}
