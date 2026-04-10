import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actor/actor_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActorScreen extends ConsumerWidget {
  static const name= 'actor-screen';
  final String actorId;

  const ActorScreen({
    super.key, 
    required this.actorId
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final actorData = ref.watch(actorByIdProvider(actorId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
            context.pop();
          }, icon: Icon(Icons.arrow_back_ios))
      ),
      body: _ActorView(actorDataAsync: actorData)
      
    );
  }
}

class _ActorView extends StatelessWidget {

  final AsyncValue<Actor> actorDataAsync;

  const _ActorView({required this.actorDataAsync});

  @override
  Widget build(BuildContext context) {
    return actorDataAsync.when(
      data:(actor) => Column(
        children: [
          Image.network(actor.profilePath),
          Text(actor.name),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(strokeWidth: 2,)),
        error: (e,_) => Text('Error: $e')
        
      );
    
  }
}