import 'package:add_firebase_to_your_flutter_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teachers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Teachers Ranking'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
        title: Row(children: [
          Expanded(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(document['avatar']),
                ),
              ),
              Text(
                document['name'],
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          )),
          const SizedBox(height: 8),
          Container(
              decoration: BoxDecoration(
                color: const Color(0xffddddff),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                document['likes'].toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ))
        ]),
        onTap: () {
          FirebaseFirestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap =
                await transaction.get(document.reference);
            transaction.update(freshSnap.reference, {
              'likes': freshSnap['likes'] + 1,
            });
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('escuela_profesores')
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemExtent: 100.0,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.docs[index]),
              );
            },
          ),
        ));
  }
}
