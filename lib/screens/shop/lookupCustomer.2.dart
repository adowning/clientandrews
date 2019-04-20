import 'package:material_search/material_search.dart';

import 'package:flutter/material.dart';
import 'package:algolia/algolia.dart';
// import 'package:clientandrews/models/workorder.dart';

Algolia algolia;
const _list = const [
  'Igor Minar',
  'Brad Green',
  'Dave Geddes',
  'Naomi Black',
  'Greg Weber',
  'Dean Sofer',
  'Wes Alvaro',
  'John Scott',
  'Daniel Nadasi',
];

// void main() {
//   String _selected;

//   runApp(new Scaffold(
//     body: new MaterialSearchInput<String>(
//       //placeholder of the input and of the search bar text input
//       placeholder: 'Search',
//       //text of the input, to indicate which value is selected
//       valueText: _selected ?? '',

//       getResults: (String criteria) async {
//         var list = await _fetchList(criteria);
//         return list
//             .map((name) => new MaterialSearchResult<String>(
//                   value: name, //The value must be of type <String>
//                   text: name, //String that will be show in the list
//                   icon: Icons.person,
//                 ))
//             .toList();
//       },
//       //or
//       results: _list
//           .map((name) => new MaterialSearchResult<String>(
//                 value: name, //The value must be of type <String>
//                 text: name, //String that will be show in the list
//                 icon: Icons.person,
//               ))
//           .toList(),

//       //optional. default filter will look like this:
//       filter: (String value, String criteria) {
//         return value
//             .toString()
//             .toLowerCase()
//             .trim()
//             .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
//       },
//       //optional
//       sort: (String value, String criteria) {
//         return 0;
//       },
//       //callback when some value is selected
//       onSelect: (String selected) {
//         if (selected == null) {
//           //user closed the MaterialSearch without selecting any value
//           return;
//         }

//         setState(() {
//           _selected = selected;
//         });
//       },
//     ),
//   ));
// }

class ExamplePage extends StatefulWidget {
  static const String routeName = '/material/search';

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<ExamplePage> {
  final Algolia algolia = Algolia.init(
    applicationId: '59EXPAJLR4',
    apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
  );
  // final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selected;

  String criteria;
  String _lastIntegerSelected;

  _fetchList(criteria) async {
    AlgoliaQuery searched =
        algolia.instance.index('employees').search(criteria);
    AlgoliaQuerySnapshot response = await searched.getObjects();

    List<AlgoliaQuerySnapshot> list;
    return response.hits;
  }

  @override
  Widget build(BuildContext context) {
    // AlgoliaQuery aquery = algolia.instance.index('employees').search(_selected);
    return Scaffold(
      body: new MaterialSearchInput<String>(
        //placeholder of the input and of the search bar text input
        placeholder: 'Search',
        //text of the input, to indicate which value is selected
        // valueText: _selected ?? '',

        getResults: (String criteria) async {
          var list = await _fetchList(criteria);
          return list
              .map((name) => new MaterialSearchResult<String>(
                    value: name, //The value must be of type <String>
                    text: name, //String that will be show in the list
                    icon: Icons.person,
                  ))
              .toList();
        },
        //or
        results: _list
            .map((name) => new MaterialSearchResult<String>(
                  value: name, //The value must be of type <String>
                  text: name, //String that will be show in the list
                  icon: Icons.person,
                ))
            .toList(),

        //optional. default filter will look like this:
        filter: (String value, String criteria) {
          return value
              .toString()
              .toLowerCase()
              .trim()
              .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
        },
        //optional
        // sort: (String value, String criteria) {
        //   return 0;
        // },
        //callback when some value is selected
        onSelect: (String selected) {
          if (selected == null) {
            //user closed the MaterialSearch without selecting any value
            return;
          }

          setState(() {
            _selected = selected;
          });
        },
      ),
    );
  }
}

// // Copyright 2018 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// import 'package:flutter/material.dart';
// import 'package:algolia/algolia.dart';
// // import 'package:clientandrews/models/workorder.dart';

// Algolia algolia;
// // import '../../gallery/demo.dart';

// class ExamplePage extends StatefulWidget {
//   static const String routeName = '/material/search';

//   @override
//   _SearchDemoState createState() => _SearchDemoState();
// }

// class _SearchDemoState extends State<ExamplePage> {
//   final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   String _lastIntegerSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//           leading: IconButton(
//             tooltip: 'Navigation menu',
//             icon: AnimatedIcon(
//               icon: AnimatedIcons.menu_arrow,
//               color: Colors.white,
//               progress: _delegate.transitionAnimation,
//             ),
//             onPressed: () {
//               _scaffoldKey.currentState.openDrawer();
//             },
//           ),
//           title: const Text('Numbers'),
//           actions: <Widget>[
//             IconButton(
//                 tooltip: 'Search',
//                 icon: const Icon(Icons.search),
//                 onPressed: () async {
//                   showSearch(
//                     context: context,
//                     delegate: _SearchDemoSearchDelegate(),
//                   );

//                   // final String selected = await showSearch(
//                   //   context: context,
//                   //   delegate: _SearchDemoSearchDelegate(),
//                   // );
//                   // if (selected != null && selected != _lastIntegerSelected) {
//                   //   setState(() {
//                   //     _lastIntegerSelected = selected;
//                   //   });
//                   // }
//                 }),

//             // MaterialDemoDocumentationButton(SearchDemo.routeName),
//             IconButton(
//               tooltip: 'More (not implemented)',
//               icon: Icon(
//                 Theme.of(context).platform == TargetPlatform.iOS
//                     ? Icons.more_horiz
//                     : Icons.more_vert,
//               ),
//               onPressed: () {},
//             ),
//           ]),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MergeSemantics(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const <Widget>[
//                       Text('Press the '),
//                       Tooltip(
//                         message: 'search',
//                         child: Icon(
//                           Icons.search,
//                           size: 18.0,
//                         ),
//                       ),
//                       Text(' icon in the AppBar'),
//                     ],
//                   ),
//                   const Text(
//                       'and search for an integer between 0 and 100,000.'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 64.0),
//             Text('Last selected integer: ${_lastIntegerSelected ?? 'NONE'}.'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         tooltip: 'Back', // Tests depend on this label to exit the demo.
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         label: const Text('Close demo'),
//         icon: const Icon(Icons.close),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: <Widget>[
//             const UserAccountsDrawerHeader(
//               accountName: Text('Peter Widget'),
//               accountEmail: Text('peter.widget@example.com'),
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage(
//                   'people/square/peter.png',
//                   package: 'flutter_gallery_assets',
//                 ),
//               ),
//               margin: EdgeInsets.zero,
//             ),
//             MediaQuery.removePadding(
//               context: context,
//               // DrawerHeader consumes top MediaQuery padding.
//               removeTop: true,
//               child: const ListTile(
//                 leading: Icon(Icons.payment),
//                 title: Text('Placeholder'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SearchDemoSearchDelegate extends SearchDelegate {
//   static final Algolia algolia = Algolia.init(
//     applicationId: '59EXPAJLR4',
//     apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
//   );

//   final List<String> _data =
//       List<String>.generate(100001, (int i) => "asdf").reversed.toList();
//   final List<String> _history = <String>[
//     "42607",
//     "85604",
//     "66374",
//     "44",
//     "174"
//   ];

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final Iterable<String> suggestions = query.isEmpty
//         ? _history
//         : _data.where((String i) => i.startsWith(query));

//     return _SuggestionList(
//       query: query,
//       suggestions: suggestions.map<String>((String i) => i).toList(),
//       onSelected: (String suggestion) {
//         query = suggestion;
//         showResults(context);
//       },
//     );
//   }

//   Future<AlgoliaQuerySnapshot> _getResults() async {
//     AlgoliaQuery searched = algolia.instance.index('employees').search(query);
//     AlgoliaQuerySnapshot response = await searched.getObjects();
//     return response;
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     AlgoliaQuery aquery = algolia.instance.index('employees').search(query);

//     // final int searched = int.tryParse(query);
//     // AlgoliaQuery searched = algolia.instance.index('employees').search(query);
//     // AlgoliaQuerySnapshot res = await searched.getObjects();
//     var res = _getResults();
//     // if (searched == null || !_data.contains(searched)) {
//     if (res == null) {
//       return Center(
//         child: Text(
//           '"$query"\n is not a valid integer between 0 and 100,000.\nTry again.',
//           textAlign: TextAlign.center,
//         ),
//       );
//     }
//     return Column(
//       children: <Widget>[
//         //Build the results based on the searchResults stream in the searchBloc
//         StreamBuilder(
//           // stream: InheritedBlocs.of(context).searchBloc.searchResults,
//           stream: Stream.fromFuture(aquery.getObjects()),
//           builder: (context, AsyncSnapshot<AlgoliaQuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Center(child: CircularProgressIndicator()),
//                 ],
//               );
//             } else if (snapshot.data.index.length == 0) {
//               return Column(
//                 children: <Widget>[
//                   Text(
//                     "No Results Found.",
//                   ),
//                 ],
//               );
//             } else {
//               var results = snapshot.data;
//               return ListView.builder(
//                 itemCount: results.hits.length,
//                 itemBuilder: (context, index) {
//                   var result = results.hits[index];
//                   return _ResultCard(
//                     title: 'This integer',
//                     integer: result.toString(),
//                     searchDelegate: this,
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }

// return ListView(
//   children: <Widget>[
//     _ResultCard(
//       title: 'This integer',
//       integer: res.hits.elementAt(0).toString(),
//       searchDelegate: this,
//     ),
//     // _ResultCard(
//     //   title: 'Next integer',
//     //   integer:  searched.getObjects().toString() + 1,
//     //   searchDelegate: this,
//     // ),
//     // _ResultCard(
//     //   title: 'Previous integer',
//     //   integer:  searched.getObjects(). toString() - 1,
//     //   searchDelegate: this,
//     // ),
//   ],
// );

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       query.isEmpty
//           ? IconButton(
//               tooltip: 'Voice Search',
//               icon: const Icon(Icons.mic),
//               onPressed: () {
//                 query = 'TODO: implement voice input';
//               },
//             )
//           : IconButton(
//               tooltip: 'Clear',
//               icon: const Icon(Icons.clear),
//               onPressed: () {
//                 query = '';
//                 showSuggestions(context);
//               },
//             ),
//     ];
//   }
// }

// class _ResultCard extends StatelessWidget {
//   const _ResultCard({this.integer, this.title, this.searchDelegate});

//   final String integer;
//   final String title;
//   final SearchDelegate searchDelegate;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () {
//         searchDelegate.close(context, integer);
//       },
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Text(title),
//               Text(
//                 '$integer',
//                 style: theme.textTheme.headline.copyWith(fontSize: 72.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _SuggestionList extends StatelessWidget {
//   const _SuggestionList({this.suggestions, this.query, this.onSelected});

//   final List<String> suggestions;
//   final String query;
//   final ValueChanged<String> onSelected;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, int i) {
//         final String suggestion = suggestions[i];
//         return ListTile(
//           leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
//           title: RichText(
//             text: TextSpan(
//               text: suggestion.substring(0, query.length),
//               style:
//                   theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: suggestion.substring(query.length),
//                   style: theme.textTheme.subhead,
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             onSelected(suggestion);
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:algolia/algolia.dart';
// import 'package:clientandrews/models/workorder.dart';

// Algolia algolia;

// class CustomSearchDelegate extends SearchDelegate {
//   static final Algolia algolia = Algolia.init(
//     applicationId: '59EXPAJLR4',
//     apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
//   );

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     assert(context != null);
//     final ThemeData theme = Theme.of(context);
//     assert(theme != null);
//     return theme;
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.length < 3) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: Text(
//               "Search term must be longer than two letters.",
//             ),
//           )
//         ],
//       );
//     }

//     //Add the search term to the searchBloc.
//     //The Bloc will then handle the searching and add the results to the searchResults stream.
//     //This is the equivalent of submitting the search term to whatever search service you are using
//     // InheritedBlocs.of(context).searchBloc.searchTerm.add(query);
//     AlgoliaQuery aquery = algolia.instance.index('employees').search(query);

//     return Column(
//       children: <Widget>[
//         //Build the results based on the searchResults stream in the searchBloc
//         StreamBuilder(
//           // stream: InheritedBlocs.of(context).searchBloc.searchResults,
//           stream: Stream.fromFuture(aquery.getObjects()),
//           builder: (context, AsyncSnapshot<AlgoliaQuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Center(child: CircularProgressIndicator()),
//                 ],
//               );
//             } else if (snapshot.data.index.length == 0) {
//               return Column(
//                 children: <Widget>[
//                   Text(
//                     "No Results Found.",
//                   ),
//                 ],
//               );
//             } else {
//               var results = snapshot.data;
//               return ListView.builder(
//                 itemCount: results.index.length,
//                 itemBuilder: (context, index) {
//                   var result = results.index[index];
//                   return ListTile(
//                     title: Text(result),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // This method is called everytime the search term changes.
//     // If you want to add search suggestions as the user enters their search term, this is the place to do that.
//     return Column();
//   }
// }

// class SearchApp {
//   static final Algolia algolia = Algolia.init(
//     applicationId: '59EXPAJLR4',
//     apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
//   );
// }

// class PhoneLookupPage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<PhoneLookupPage>
//     with SingleTickerProviderStateMixin {
//   Algolia algolia;
//   @override
//   void initState() {
//     setup();
//     controller = TabController(
//       length: 3,
//       vsync: this,
//     );
//     super.initState();
//   }

//   void setup() async {
//     algolia = SearchApp.algolia;
//   }

//   TabController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             title: Text("SilverAppBar title"),
//             // pinned: true,
//             primary: true,
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.search),
//                 onPressed: () {
//                   showSearch(
//                     context: context,
//                     delegate: CustomSearchDelegate(),
//                   );
//                 },
//               ),
//             ],
//             snap: true,
//             floating: true,
//             expandedHeight: 160.0,
//             // **Is it intended ?** flexibleSpace.title overlaps with tabs title.
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text("FlexibleSpace title"),
//             ),
//             bottom: TabBar(
//               tabs: [
//                 Tab(text: 'Tab 1'),
//                 Tab(text: 'Tab 2'),
//                 Tab(text: 'Tab 3'),
//               ],
//               controller: controller,
//             ),
//           ),
//           // SliverList(
//           SliverFillRemaining(
//             child: TabBarView(
//               controller: controller,
//               children: <Widget>[
//                 Center(child: Text("Tab one")),
//                 Center(child: Text("Tab two")),
//                 Center(child: Text("Tab three")),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
