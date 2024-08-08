import "package:envied/envied.dart";
{{#use_serverpod}}import 'package:serverpod_flutter/serverpod_flutter.dart';
{{/use_serverpod}}
part "env.g.dart";

/// Environment variables.
@Envied(useConstantCase: true)
abstract class Env {
{{#use_serverpod}}  /// Serverpod API endpoint
  @EnviedField(defaultValue: "http://$localhost:8080/")
  static const String apiEndpoint = _Env.apiEndpoint;{{/use_serverpod}}
}
