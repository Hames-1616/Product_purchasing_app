import 'package:alemeno/features/home/repos/home_repo.dart';
import 'package:alemeno/models/test_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeControllerProvider = StateNotifierProvider<homeController, bool>(
    (ref) => homeController(chomerepo: ref.watch(homeRepoProvider), cref: ref));

final getPopularProvider = StreamProvider(
    (ref) => ref.watch(homeControllerProvider.notifier).getPopular());

class homeController extends StateNotifier<bool> {
  final HomeRepo homerepo;
  final Ref ref;
  homeController({
    required HomeRepo chomerepo,
    required Ref cref,
  })  : homerepo = chomerepo,
        ref = cref,
        super(false);

  Stream<List<TestModel>> getPopular() {
    return homerepo.getPopular();
  }

  void Updatecart({required String Name}) {
    homerepo.updateCart(Name);
  }

  void removeCart({required String Name}) {
    homerepo.removeCart(Name);
  }


}
