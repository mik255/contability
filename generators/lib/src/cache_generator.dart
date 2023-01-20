
// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';

import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class CacheGenerator extends GeneratorForAnnotation<CacheJsonGenerator> {
  @override
  String generateForAnnotatedElement(
      Element element,
      ConstantReader annotation,
      BuildStep buildStep,
      ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    String className = visitor.className;
    buffer.writeln('class ${className}Gen{');
    buffer.writeln('List<$className> getList(String key) {');
    buffer.writeln('try {');
    buffer.writeln('List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];');
    buffer.writeln('List<$className> list = dataListFromdb.map((e) => $className.fromJson(e)).toList();');
    buffer.writeln('return list;');
    buffer.writeln('} catch (e, _) {');
    buffer.writeln('rethrow;');
    buffer.writeln('}');
    buffer.writeln('}');

    buffer.writeln('//add item to list');

    buffer.writeln('addItemToList(String key, $className t) async {');
    buffer.writeln('try {');
    buffer.writeln('List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];');
    buffer.writeln('dataListFromdb.add(t.toJson());');
    buffer.writeln('MainStances.prefs.setStringList(key, dataListFromdb);');
    buffer.writeln('} catch (e, _) {');
    buffer.writeln('rethrow;');
    buffer.writeln('}');
    buffer.writeln('}');

    buffer.writeln('//update item list');

    buffer.writeln('updateItemList(String key, $className t) async {');
    buffer.writeln('try {');
    buffer.writeln('List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];');
    buffer.writeln('dataListFromdb.removeWhere((element) => t.id == json.decode(element)["id"]);');
    buffer.writeln('dataListFromdb.add(t.toJson());');
    buffer.writeln('MainStances.prefs.setStringList(key, dataListFromdb);');
    buffer.writeln('} catch (e, _) {');
    buffer.writeln('rethrow;');
    buffer.writeln('}');
    buffer.writeln('}');

    buffer.writeln('//delete item list');

    buffer.writeln('deleteItemList(String key, $className t) async {');
    buffer.writeln('try {');
    buffer.writeln('List<String> dataListFromdb = MainStances.prefs.getStringList(key) ?? [];');
    buffer.writeln('dataListFromdb.removeWhere((element) => t.id == json.decode(element)["id"]);');
    buffer.writeln('MainStances.prefs.setStringList(key, dataListFromdb);');
    buffer.writeln('} catch (e, _) {');
    buffer.writeln('rethrow;');
    buffer.writeln('}');
    buffer.writeln('}');

    buffer.writeln('}');

    return buffer.toString();
  }
}
