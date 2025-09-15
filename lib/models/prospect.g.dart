// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prospect.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProspectAdapter extends TypeAdapter<Prospect> {
  @override
  final int typeId = 0;

  @override
  Prospect read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Prospect(
      nom: fields[0] as String,
      prenom: fields[1] as String,
      dateNaissance: fields[2] as DateTime,
      email: fields[3] as String,
      telephone: fields[4] as String?,
      ville: fields[5] as String?,
      niveauEtudes: fields[6] as String?,
      formation: fields[7] as String,
      commentaires: fields[8] as String?,
      consentementRGPD: fields[9] as bool,
      isSynced: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Prospect obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.prenom)
      ..writeByte(2)
      ..write(obj.dateNaissance)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.telephone)
      ..writeByte(5)
      ..write(obj.ville)
      ..writeByte(6)
      ..write(obj.niveauEtudes)
      ..writeByte(7)
      ..write(obj.formation)
      ..writeByte(8)
      ..write(obj.commentaires)
      ..writeByte(9)
      ..write(obj.consentementRGPD)
      ..writeByte(10)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProspectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
