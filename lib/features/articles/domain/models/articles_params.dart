class ArticlesParams {
  late final int period;

  ArticlesParams({required this.period});

  ArticlesParams.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['period'] = period;
    return data;
  }
}
