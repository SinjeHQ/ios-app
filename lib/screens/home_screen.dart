import 'package:flutter/material.dart';
import '../services/sync_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ClickColorButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final Widget icon;
  final Widget label;
  final Color color; // couleur principale (texte/icône et fond au clic)

  const ClickColorButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  State<ClickColorButton> createState() => _ClickColorButtonState();
}

class _ClickColorButtonState extends State<ClickColorButton> {
  bool _clicked = false;

  Future<void> _handlePressed() async {
    setState(() {
      _clicked = true;
    });
    await widget.onPressed();
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _clicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _handlePressed,
      icon: IconTheme(
        data: IconThemeData(color: _clicked ? Colors.white : widget.color),
        child: widget.icon,
      ),
      label: DefaultTextStyle(
        style: TextStyle(
          color: _clicked ? Colors.white : widget.color,
          fontSize: 18,
        ),
        child: widget.label,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _clicked ? widget.color : Colors.white,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: const BorderSide(color: Colors.grey, width: 1.5),
        elevation: 0,
      ),
    );
  }
}

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

  Future<void> _navigateToForm(BuildContext context) async {
    Navigator.pushNamed(context, '/form');
  }

  Future<void> _navigateToHistory(BuildContext context) async {
    Navigator.pushNamed(context, '/history');
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
                ClickColorButton(
                  onPressed: () => _navigateToForm(context),
                  icon: const Icon(Icons.person_add),
                  label: const Text('Nouvelle inscription'),
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                ClickColorButton(
                  onPressed: () => _navigateToHistory(context),
                  icon: const Icon(Icons.history),
                  label: const Text('Historique'),
                  color: Colors.red,
                ),
                const SizedBox(height: 20),
                ClickColorButton(
                  onPressed: () => _synchroniser(context),
                  icon: const Icon(Icons.sync),
                  label: const Text('Synchroniser'),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
