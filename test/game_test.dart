import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_gunluk_ritim/oyun_gunluk_ritim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(gunlukRitimConfig.title.length, 33);
    expect(gunlukRitimConfig.tagline.length, 33);
    for (final s in gunlukRitimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(gunlukRitimConfig.gameId, gunlukRitimId);
    expect(gunlukRitimRules.gameId, gunlukRitimId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(gunlukRitimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: gunlukRitimId, optionalMechanics: gunlukRitimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(gunlukRitimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
