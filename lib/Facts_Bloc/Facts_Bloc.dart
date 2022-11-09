import 'package:crypto_app/Facts_Bloc/Facts_State.dart';
import 'package:crypto_app/Facts_Bloc/Facts_event.dart';
import 'package:crypto_app/Facts_api/facts.dart';
import 'package:crypto_app/Facts_api/facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsBloc extends Bloc<FactsEvent, FactsState>{
  final FactsRepository factsRepository;
  FactsBloc(this.factsRepository): super(FactsLoadingState()){
    _loadFacts();
    on<FactsLoadEvent>((event, emit) async {
      emit(FactsLoadingState());
      _loadFacts();
    });
  }
  Future<void> _loadFacts() async {
    try{
      final List<Facts> loadedFactsList = await factsRepository.getAllFacts();
      emit(FactsLoadedState(loadedFacts: loadedFactsList));
    } catch (_){
      emit(FactsErorState());
    }
  }
}