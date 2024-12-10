// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculadora_imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculadoraImcModelAdapter extends TypeAdapter<CalculadoraImcModel> {
  @override
  final int typeId = 1;

  @override
  CalculadoraImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculadoraImcModel()
      ..idade = fields[0] as int
      ..altura = fields[1] as double
      ..peso = fields[2] as double;
  }

  @override
  void write(BinaryWriter writer, CalculadoraImcModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.idade)
      ..writeByte(1)
      ..write(obj.altura)
      ..writeByte(2)
      ..write(obj.peso);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculadoraImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
