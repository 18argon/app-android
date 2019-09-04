import 'package:app_secomp/pages/cronograma/cronograma.dart';
import 'package:app_secomp/pages/home/bloc_home.dart';
import 'package:app_secomp/pages/intro/intro.dart';
import 'package:app_secomp/components/map_widget.dart';
import 'package:app_secomp/pages/login/login.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:app_secomp/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'components/logo.dart';
import 'package:app_secomp/pages/home/home.dart';
import 'package:app_secomp/pages/blank.dart';
import 'package:app_secomp/pages/sobre/sobre.dart';
import 'package:app_secomp/pages/participante/participante.dart';
import 'package:app_secomp/pages/patrocinadores/patrocinadores.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Widget _body = HomePage();
  String _title = "X SECOMP";
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  final BlocHome _blocHome = BlocProvider.getBloc<BlocHome>();

  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _blocHome.loadNoticias();
      },
    );
  }

  void _pushTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _updatePage(Widget body, {String title: "X SECOMP"}) {
      setState(() {
        _body = body;
        _title = title;
      });
      Navigator.pop(context);
    }

    _blocHome.loadNoticias();

    Drawer _drawer = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: LogoSeKombi()),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => _updatePage(HomePage()),
          ),
          ListTile(
            title: Text("Exemplo Mapa"),
            leading: Icon(Icons.home),
            onTap: () => _updatePage(MapWidget()),
          ),
          ListTile(
            title: Text("Área do Participante"),
            leading: Icon(Icons.person),
            onTap: () => _updatePage(ParticipanteScreen(),
                title: "Área do Participante"),
          ),
          ListTile(
            title: Text("Cronograma"),
            leading: Icon(Icons.calendar_view_day),
            onTap: () => _updatePage(Cronograma(), title: "Cronograma"),
          ),
          ListTile(
            title: Text("Equipe"),
            leading: Icon(Icons.people),
            onTap: () => _updatePage(BlankPage(), title: "Equipe"),
          ),
          ListTile(
            title: Text("Patrocinadores"),
            leading: Icon(Icons.star),
            onTap: () => _updatePage(Patrocinadores(), title: "Patrocinadores"),
          ),
          ListTile(
            title: Text("Login"),
            leading: Icon(Icons.star),
            onTap: () => _pushTo(CamposLogin()),
          ),
          ListTile(
            title: Text("Dicas"),
            leading: Icon(Icons.lightbulb_outline),
            onTap: () => _pushTo(Intro()),
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.info),
            onTap: () => _updatePage(Sobre(), title: "Sobre"),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          _title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColorStart: SecompColors.gradientStart,
        backgroundColorEnd: SecompColors.gradientEnd,
      ),
      drawer: _drawer,
      body: _body,
    );
  }
}
