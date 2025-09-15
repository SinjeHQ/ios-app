import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/prospect.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _nom,
      _prenom,
      _email,
      _telephone,
      _ville,
      _niveauEtudes,
      _formation,
      _commentaires;
  DateTime? _dateNaissance;
  bool _consentementRGPD = false;

  final List<String> _niveauxEtudes = [
    'Bac',
    'Bac+1',
    'Bac+2',
    'Licence',
    'Master',
    'Autre',
  ];
  final List<String> _formations = [
    'DUT Informatique',
    'BUT Génie Mécanique',
    'Licence Pro Robotique',
    'Master IA',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _dateNaissance = date);
  }

  void _soumettreFormulaire() async {
    if (!_consentementRGPD) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Consentement RGPD requis')));
      return;
    }

    if (_formKey.currentState!.validate() &&
        _dateNaissance != null &&
        _formation != null) {
      _formKey.currentState!.save();
      final newProspect = Prospect(
        nom: _nom!,
        prenom: _prenom!,
        dateNaissance: _dateNaissance!,
        email: _email!,
        telephone: _telephone,
        ville: _ville,
        niveauEtudes: _niveauEtudes,
        formation: _formation!,
        commentaires: _commentaires,
        consentementRGPD: _consentementRGPD,
      );
      final box = Hive.box<Prospect>('prospects');
      await box.add(newProspect);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Formulaire enregistré !')));
      _formKey.currentState!.reset();
      setState(() {
        _dateNaissance = null;
        _formation = null;
        _consentementRGPD = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = _dateNaissance != null
        ? DateFormat('dd/MM/yyyy').format(_dateNaissance!)
        : 'Sélectionner la date';

    return Scaffold(
      appBar: AppBar(title: const Text("Nouveau Prospect")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Champ requis' : null,
                onSaved: (val) => _nom = val,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Champ requis' : null,
                onSaved: (val) => _prenom = val,
              ),
              const SizedBox(height: 12),
              Text('Date de naissance: $dateFormatted'),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('📅 Choisir une date'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Adresse e-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val != null && val.contains('@') ? null : 'Email invalide',
                onSaved: (val) => _email = val,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Formation souhaitée',
                ),
                value: _formation,
                items: _formations
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (val) => setState(() => _formation = val),
                validator: (val) =>
                    val == null ? 'Sélection obligatoire' : null,
                onSaved: (val) => _formation = val,
              ),
              const SizedBox(height: 12),
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
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _niveauEtudes = val),
                onSaved: (val) => _niveauEtudes = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Commentaires'),
                maxLines: 3,
                onSaved: (val) => _commentaires = val,
              ),
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
