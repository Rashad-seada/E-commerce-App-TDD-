import 'dart:io';

Future<String> fixtureReader(String fileName) =>
    File("lib/core/fixtures/$fileName").readAsString();