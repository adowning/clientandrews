import 'package:flutter/material.dart';

import 'package:material_search/material_search.dart';
import 'package:algolia/algolia.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ExamplePage> {
  static final Algolia algolia = Algolia.init(
    applicationId: '59EXPAJLR4',
    apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
  );
  List<String> _names = [
    '',
    // 'Brad Green',
    // 'Dave Geddes',
    // 'Naomi Black',
    // 'Greg Weber',
    // 'Dean Sofer',
    // 'Wes Alvaro',
    // 'John Scott',
    // 'Daniel Nadasi',
  ];
  void _fetchList() async {
    AlgoliaQuery searched = algolia.instance.index('accounts').search('');
    var result = await searched.getObjects();
    _names = List<String>();
    result.hits.forEach((f) => {_names.add(f.data['accountName'])});
  }

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  String _name = 'No one';

  final _formKey = new GlobalKey<FormState>();

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names
                  .map((String v) => new MaterialSearchResult<String>(
                        icon: Icons.person,
                        value: v,
                        text: "$v",
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("xx"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              _showMaterialSearch(context);
            },
            tooltip: 'Search',
            icon: new Icon(Icons.search),
          )
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: new Text("You found: ${_name ?? 'No one'}"),
            ),
            new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new MaterialSearchInput<String>(
                      placeholder: 'Name',
                      results: _names
                          .map((String v) => new MaterialSearchResult<String>(
                                icon: Icons.person,
                                value: v,
                                text: "$v",
                              ))
                          .toList(),
                      filter: (dynamic value, String criteria) {
                        return value.toLowerCase().trim().contains(new RegExp(
                            r'' + criteria.toLowerCase().trim() + ''));
                      },
                      onSelect: (dynamic v) {
                        print(v);
                      },
                      validator: (dynamic value) =>
                          value == null ? 'Required field' : null,
                      formatter: (dynamic v) => 'Hello, $v',
                    ),
                    new MaterialButton(
                        child: new Text('Validate'),
                        onPressed: () {
                          _formKey.currentState.validate();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _showMaterialSearch(context);
        },
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ),
    );
  }
}
