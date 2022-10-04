// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textfieldmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextFieldModelAdapter extends TypeAdapter<TextFieldModel> {
  @override
  final int typeId = 0;

  @override
  TextFieldModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextFieldModel()
      ..name = fields[0] as String
      ..rollno = fields[1] as String
      ..degree = fields[2] as String
      ..section = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, TextFieldModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rollno)
      ..writeByte(2)
      ..write(obj.degree)
      ..writeByte(3)
      ..write(obj.section);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextFieldModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
