import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_lessons/sayac_manager.dart';

import 'model/sayac_model.dart';

final titleProvider = Provider<String>((ref) => 'Riverpod Basics');
final title2Provider =
    Provider<String>((ref) => 'Riverpod State Notifier Kullanimi');

final textProvider = Provider<String>(
  (ref) {
    return 'Butona Basılma Sayısı';
  },
);

final sayacStateProvider = StateProvider<int>(((ref) {
  return 0;
}));

final sayacNotifierProvider =
    StateNotifierProvider<SayacManager, SayacModel>((ref) {
  return SayacManager();
});
