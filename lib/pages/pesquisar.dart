import 'package:flutter/material.dart';
import 'adicionarItem.dart';
import 'package:searchfield/searchfield.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';

class Pesquisar extends StatefulWidget {
  const Pesquisar({Key? key}) : super(key: key);

  @override
  _PesquisarState createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  // String searchValue = '';
  // final List<String> _suggestions = [
  //   'Afghanistan',
  //   'Albania',
  //   'Algeria',
  //   'Australia',
  //   'Brazil',
  //   'Germany',
  //   'Madagascar',
  //   'Mozambique',
  //   'Portugal',
  //   'Zambia',
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisar'),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            // ignore: unused_label

            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20)),
              onTap: () {
                controller.openView();
              },
              onChanged: (e) {
                controller.openView();
              },
              leading: const Icon(Icons.search_off),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(4, (int index) {
              final String item = 'item $index';
              return ListTile(
                leading: const Icon(Icons.pages),
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                  Container(
                    child: Text("dddddddd"),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    color: Colors.amber,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                  );
                },
              );
            });
          }),
        ),
      ),
    );
    // ignore: dead_code
  }
}
  

/* 
  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisar'),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            // ignore: unused_label

            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20)),
              onTap: () {
                controller.openView();
              },
              onChanged: (e) {
                controller.openView();
              },
              leading: const Icon(Icons.search_off),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(4, (int index) {
              final String item = 'item $index';
              return ListTile(
                leading: const Icon(Icons.pages),
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
      ),
    );

 */