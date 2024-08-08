/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Example
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Example._({required this.id});

  factory Example({required int id}) = _ExampleImpl;

  factory Example.fromJson(Map<String, dynamic> jsonSerialization) {
    return Example(id: jsonSerialization['id'] as int);
  }

  int id;

  Example copyWith({int? id});
  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'id': id};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ExampleImpl extends Example {
  _ExampleImpl({required int id}) : super._(id: id);

  @override
  Example copyWith({int? id}) {
    return Example(id: id ?? this.id);
  }
}
