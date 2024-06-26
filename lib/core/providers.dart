import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/core/name_notifier.dart';

final nameProvider = StateNotifierProvider<Name, String>((ref) {
  return Name();
});
