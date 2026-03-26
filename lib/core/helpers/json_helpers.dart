int? asInt(dynamic x) => x is int ? x : null;
String? asString(dynamic x) => x is String ? x : null;
bool? asBool(dynamic x) => x is bool ? x : null;
double? asDouble(dynamic x) => x is num ? x.toDouble() : null;