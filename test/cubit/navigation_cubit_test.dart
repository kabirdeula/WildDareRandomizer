import 'package:flutter_test/flutter_test.dart';
import 'package:wild_dare_randomizer/cubits/navigation_cubit.dart';

void main() {
  group('NavigationCubit', () {
    late NavigationCubit cubit;

    setUp(() {
      cubit = NavigationCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is correct', () {
      expect(cubit.state.selectedIndex, 0);
      expect(cubit.state.appBarTitle, 'Uno Dare Randomizer');
    });

    test('updates state on navigation', () {
      cubit.emit(
        const NavigationState(
          selectedIndex: 1,
          appBarTitle: 'Favorites',
        ),
      );

      expect(cubit.state.selectedIndex, 1);
      expect(cubit.state.appBarTitle, 'Favorites');
    });
  });
}
