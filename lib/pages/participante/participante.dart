import 'package:app_secomp/pages/participante/bloc_participante.dart';
import 'package:app_secomp/pages/participante/dados_participante.dart';
import 'package:app_secomp/pages/participante/presencas.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ParticipanteScreen extends StatefulWidget {
  @override
  _ParticipanteScreenState createState() => _ParticipanteScreenState();
}

class _ParticipanteScreenState extends State<ParticipanteScreen> {
  List<Widget> _body = [
    DadosParticipante(),
    PresencasScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final BlocParticipante bloc = BlocProvider.getBloc<BlocParticipante>();
    

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: _body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("Dados")),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), title: Text("Presenças")),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
