import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Champs du formulaire
  String? _nom;
  String? _prenom;
  String? _email;
  String? _telephone;
  String? _ville;
  String? _niveauEtudes;
  String? _formation;
  String? _commentaires;
  DateTime? _dateNaissance;
  bool _consentementRGPD = false;

  // Dropdowns
  List<String> _formations = []; // à charger dynamiquement
  List<String> _niveauxEtudes = [
    'Bac',
    'Bac +1',
    'Bac +2',
    'Licence',
    'Master',
    'Autre',
  ];

  @override
  void initState() {
    super.initState();
    _chargerFormations();
  }

  Future<void> _chargerFormations() async {
    // Simule un appel API REST
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _formations = [
        'DUT Informatique',
        'BUT Génie Mécanique',
        'Licence Pro Robotique',
        'Master IA',
      ];
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final dateChoisie = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (dateChoisie != null) {
      setState(() {
        _dateNaissance = dateChoisie;
      });
    }
  }

  void _soumettreFormulaire() {
    if (!_consentementRGPD) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vous devez accepter le consentement RGPD'),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Tu peux ensuite enregistrer ou envoyer les données ici
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulaire soumis avec succès')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = _dateNaissance != null
        ? DateFormat('dd/MM/yyyy').format(_dateNaissance!)
        : 'Sélectionner la date';

    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau Prospect')),
      body: _formations.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Champs obligatoires',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nom'),
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Champ requis' : null,
                      onSaved: (val) => _nom = val,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Prénom'),
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Champ requis' : null,
                      onSaved: (val) => _prenom = val,
                    ),
                    const SizedBox(height: 12),
                    Text('Date de naissance : $dateFormatted'),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('📅 Choisir une date'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Adresse e-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val != null && val.contains('@')
                          ? null
                          : 'Email invalide',
                      onSaved: (val) => _email = val,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Formation souhaitée',
                      ),
                      value: _formation,
                      items: _formations
                          .map(
                            (f) => DropdownMenuItem(value: f, child: Text(f)),
                          )
                          .toList(),
                      onChanged: (val) => setState(() => _formation = val),
                      validator: (val) =>
                          val == null ? 'Sélection obligatoire' : null,
                      onSaved: (val) => _formation = val,
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      'Champs optionnels',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Numéro de téléphone',
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (val) => _telephone = val,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ville / Code postal',
                      ),
                      onSaved: (val) => _ville = val,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Niveau d\'études actuel',
                      ),
                      value: _niveauEtudes,
                      items: _niveauxEtudes
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (val) => setState(() => _niveauEtudes = val),
                      onSaved: (val) => _niveauEtudes = val,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Commentaires',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      onSaved: (val) => _commentaires = val,
                    ),

                    const SizedBox(height: 24),
                    CheckboxListTile(
                      value: _consentementRGPD,
                      onChanged: (val) =>
                          setState(() => _consentementRGPD = val ?? false),
                      title: const Text(
                        'J\'accepte le traitement de mes données (RGPD) *',
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: _soumettreFormulaire,
                        child: const Text('Soumettre'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
