import 'package:app/pages/consult_colletion_page.dart';
import 'package:app/pages/user_bookings.dart';
import 'package:app/pages/user_borrowings.dart';
import 'package:flutter/material.dart';

class HomePageSt extends StatefulWidget {
  const HomePageSt({super.key});

  @override
  State<HomePageSt> createState() => _HomePageStState();
}

class _HomePageStState extends State<HomePageSt> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(pagina) {
    setState(() {
      currentPage = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [
          UserBorrowings(),
          UserBookingsWidget(),
          ConsultPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff638D93),
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark), label: 'Empréstimos'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Reservas'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Consultar'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
