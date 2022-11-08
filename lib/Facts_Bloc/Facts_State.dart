import 'package:crypto_app/Facts_api/facts.dart';

abstract class FactsState {}

class FactsEmptyState extends FactsState {}
class FactsLoadingState extends FactsState {}
class FactsLoadedState extends FactsState {
  List<Facts> loadedFacts;
  FactsLoadedState({
    required this.loadedFacts,
  });
}
class FactsErorState extends FactsState {}