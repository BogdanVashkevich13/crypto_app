class FactListModel {
  List<dynamic>? facts;
  FactListModel({
    this.facts,
  });

  factory FactListModel.fromMap(Map<String, dynamic> map) {
    return FactListModel(facts: map['articles']);
  }
}