Future<List<Formation>> fetchFormations() async {
  final response = await http.get(
    Uri.parse('https://api.mon-ecole.fr/formations'),
  );

  if (response.statusCode == 200) {
    final List jsonData = jsonDecode(response.body);
    return jsonData.map((f) => Formation.fromJson(f)).toList();
  } else {
    throw Exception('Erreur chargement formations');
  }
}
