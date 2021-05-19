import 'package:flutter/material.dart';
import '../../models/receita.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImgDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes('${receita.porcoes} porções', receita.tempoPreparo),
          _construirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes),
          _construirSubtituloDetalhes('Modo de preparo'),
          _construirTextoDetalhes(receita.modoPreparo)
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImgDetalhes(imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo) {
    return Center(
      child: Text( titulo, style: TextStyle(color: Colors.deepOrange, fontSize: 30),
      ),
    );
  }

  Widget _construirLinhaIconesDetalhes(rendimento, tempoPreparo) {
    return Row(
      children: <Widget>[
        _construirColunaIconeDetalhes(Icons.restaurant, rendimento),
        _construirColunaIconeDetalhes(Icons.timer, tempoPreparo)
      ],
    );
  }

  Widget _construirColunaIconeDetalhes(icone, texto) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icone, color: Colors.deepOrange),
          Text(texto,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _construirSubtituloDetalhes(subtitulo) {
    return Center(
      child: Text(subtitulo, style: TextStyle(fontSize: 20)),
    );
    
  }

  Widget _construirTextoDetalhes(texto) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(texto),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em casa'));
  }
}
