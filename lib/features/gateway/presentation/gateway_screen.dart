// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wild_dare_randomizer/features/gateway/cubit/gateway_cubit.dart';
import 'package:wild_dare_randomizer/routes/routes.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

// class GatewayScreen extends StatefulWidget {
//   const GatewayScreen({super.key});

//   @override
//   State<GatewayScreen> createState() => _GatewayScreenState();
// }

// class _GatewayScreenState extends State<GatewayScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<GatewayCubit>().appLoaded();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GatewayCubit, GatewayState>(
//       builder: (context, state) {
//         return Scaffold(
//           body: Center(
//             child: state.isLoading
//                 ? const CircularProgressIndicator()
//                 : Text('Gateway Screen\n$state'),
//           ),
//         );
//       },
//       listener: (context, state) {
//         log.i('(GatewayScreen) listener: $state');
//         if (state.isLoading == false) {
//           context.go(AppRoutes.dashboard.path);
//         } else {
//           return;
//         }
//       },
//     );
//   }
// }

class GatewayScreen extends StatelessWidget {
  const GatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      context.read<GatewayCubit>().appLoaded();
    });

    return BlocConsumer<GatewayCubit, GatewayState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : Text('Gateway Screen\n$state'),
          ),
        );
      },
      listener: (context, state) {
        log.i('(GatewayScreen) listener: $state');
        if (state.isLoading == false) {
          context.go(AppRoutes.dashboard.path);
        } else {
          return;
        }
      },
    );
  }
}
