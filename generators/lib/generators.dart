library generators;

import 'package:build/build.dart';
import 'package:generators/src/cache_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) => SharedPartBuilder(
  [CacheGenerator()],
  'cache_model_generator',
);