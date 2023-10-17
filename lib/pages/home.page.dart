import 'package:cep_register/constants/string.dart';
import 'package:cep_register/pages/registered_ceps.page.dart';
import 'package:cep_register/pages/search.page.dart';
import 'package:cep_register/widgets/custon_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.currentIndex = 1, Key? key}) : super(key: key);

  final int? currentIndex;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIndex ?? 0;
    super.initState();
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: getCep,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.edit_note),
      label: registeredCep,
    ),
  ];

  final List<Widget> _screens = [
    const SearchPage(),
    const RegisteredCeps(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustonScaffold(
      body: Center(
        child: _screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
