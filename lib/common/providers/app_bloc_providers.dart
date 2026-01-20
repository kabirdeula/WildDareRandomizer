import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/deck/deck.dart';
import '../../features/rules/rules.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final deckRepository = DeckRepositoryImpl(localSource: DeckLocalSource());
    final ruleRepository = RuleRepositoryImpl(
      localSource: RuleLocalSource(),
      assetSource: RuleAssetSource(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RulesCubit(repository: ruleRepository)),
        BlocProvider(
          create: (_) => DeckCubit(
            deckRepository: deckRepository,
            ruleRepository: ruleRepository,
            playedRulesSource: PlayedRulesLocalSource(),
          ),
        ),
      ],
      child: child,
    );
  }
}
