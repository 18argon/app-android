import 'package:app_secomp/models/ministrante.dart';
import 'package:app_secomp/pages/cronograma/desc_ministrante.dart';
import 'package:flutter/material.dart';

class MinistranteCard extends Container {
  MinistranteCard({this.min});
  final Ministrante min;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 1,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6),
              child: ClipOval(
                child: Image.network(
                  "https://secompufscar.com.br/uploads/fotos_ministrantes/" +
                      min.img,
                  // "https://secompufscar.com.br/static/images/logo-colorida.png",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Flexible(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          min.nome,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Text(
                          min.cargo,
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Text(
                          min.instituicao,
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: new IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MinistrantePage(min: min),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
