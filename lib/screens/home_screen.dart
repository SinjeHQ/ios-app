import 'package:flutter/material.dart';
import '../services/sync_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _synchroniser(BuildContext context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      await SyncService.syncProspects();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Synchronisation terminée !')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pas de connexion internet')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UIMM Occitanie'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 192, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset('assets/images/logo_uimm.jpg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Bienvenue dans l'application de collecte de prospects.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/form'),
                  icon: const Icon(Icons.person_add),
                  label: const Text(
                    'Nouvelle inscription',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/history'),
                  icon: const Icon(Icons.history),
                  label: const Text(
                    'Historique',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    side: const BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => _synchroniser(context),
                  icon: const Icon(Icons.sync),
                  label: const Text(
                    'Synchroniser maintenant',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
