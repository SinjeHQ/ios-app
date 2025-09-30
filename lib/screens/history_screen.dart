import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/prospect.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 192, 247),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Prospect>('prospects').listenable(),
        builder: (context, Box<Prospect> box, _) {
          if (box.isEmpty)
            return const Center(child: Text("Aucun prospect enregistré"));

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final prospect = box.getAt(index);
              return ExpansionTile(
                title: Text('${prospect!.nom} ${prospect.prenom}'),
                subtitle: Text(prospect.formation),
                children: [
                  ListTile(title: Text('Email: ${prospect.email}')),
                  if (prospect.telephone != null)
                    ListTile(title: Text('Tel: ${prospect.telephone}')),
                  if (prospect.ville != null)
                    ListTile(title: Text('Ville: ${prospect.ville}')),
                  if (prospect.niveauEtudes != null)
                    ListTile(title: Text('Niveau: ${prospect.niveauEtudes}')),
                  if (prospect.commentaires != null)
                    ListTile(
                      title: Text('Commentaires: ${prospect.commentaires}'),
                    ),
                  ListTile(
                    title: Text(
                      'Consentement RGPD: ${prospect.consentementRGPD ? "Oui" : "Non"}',
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Synchronisé: ${prospect.isSynced ? "Oui" : "Non"}',
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
