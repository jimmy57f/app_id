// alabanzas_elegidas_screen.dart

import 'package:HimnarioID/alabanza_detail_screen.dart';
import 'package:flutter/material.dart';
import 'alabanza.dart';

class AlabanzasElegidasScreen extends StatefulWidget {
  final List<Alabanza> alabanzasElegidas;
  final Function(Alabanza) removeAlabanzaElegida;
  final Function() clearAlabanzasElegidas;

  AlabanzasElegidasScreen(this.alabanzasElegidas, this.removeAlabanzaElegida,
      this.clearAlabanzasElegidas);

  @override
  _AlabanzasElegidasScreenState createState() =>
      _AlabanzasElegidasScreenState();
}

class _AlabanzasElegidasScreenState extends State<AlabanzasElegidasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Alabanzas Elegidas'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              widget.clearAlabanzasElegidas();
              setState(() {});
            },
          ),
        ],
      ),
      body: widget.alabanzasElegidas.isEmpty
          ? Center(child: Text('No hay alabanzas elegidas'))
          : ListView.builder(
              itemCount: widget.alabanzasElegidas.length,
              itemBuilder: (context, index) {
                Alabanza alabanza = widget.alabanzasElegidas[index];
                return ListTile(
                  title: Text('${alabanza.numero}. ${alabanza.titulo}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      widget.removeAlabanzaElegida(alabanza);
                      setState(() {});
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AlabanzaDetailScreen(alabanza: alabanza),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
