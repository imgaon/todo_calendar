class HomeState {
  final bool isSuccess1;
  final bool isSuccess2;
  final bool isSuccess3;
  final bool isSuccess4;
  final bool isSuccess5;
  final DateTime focusedDay;
  final DateTime selectedDay;

//<editor-fold desc="Data Methods">
  const HomeState({
    this.isSuccess1 = false,
    this.isSuccess2 = false,
    this.isSuccess3 = false,
    this.isSuccess4 = false,
    this.isSuccess5 = false,
    required this.focusedDay,
    required this.selectedDay,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeState &&
          runtimeType == other.runtimeType &&
          isSuccess1 == other.isSuccess1 &&
          isSuccess2 == other.isSuccess2 &&
          isSuccess3 == other.isSuccess3 &&
          isSuccess4 == other.isSuccess4 &&
          isSuccess5 == other.isSuccess5 &&
          focusedDay == other.focusedDay &&
          selectedDay == other.selectedDay);

  @override
  int get hashCode =>
      isSuccess1.hashCode ^
      isSuccess2.hashCode ^
      isSuccess3.hashCode ^
      isSuccess4.hashCode ^
      isSuccess5.hashCode ^
      focusedDay.hashCode ^
      selectedDay.hashCode;

  @override
  String toString() {
    return 'HomeState{' +
        ' isSuccess1: $isSuccess1,' +
        ' isSuccess2: $isSuccess2,' +
        ' isSuccess3: $isSuccess3,' +
        ' isSuccess4: $isSuccess4,' +
        ' isSuccess5: $isSuccess5,' +
        ' focusedDay: $focusedDay,' +
        ' selectedDay: $selectedDay,' +
        '}';
  }

  HomeState copyWith({
    bool? isSuccess1,
    bool? isSuccess2,
    bool? isSuccess3,
    bool? isSuccess4,
    bool? isSuccess5,
    DateTime? focusedDay,
    DateTime? selectedDay,
  }) {
    return HomeState(
      isSuccess1: isSuccess1 ?? this.isSuccess1,
      isSuccess2: isSuccess2 ?? this.isSuccess2,
      isSuccess3: isSuccess3 ?? this.isSuccess3,
      isSuccess4: isSuccess4 ?? this.isSuccess4,
      isSuccess5: isSuccess5 ?? this.isSuccess5,
      focusedDay: focusedDay ?? this.focusedDay,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isSuccess1': this.isSuccess1,
      'isSuccess2': this.isSuccess2,
      'isSuccess3': this.isSuccess3,
      'isSuccess4': this.isSuccess4,
      'isSuccess5': this.isSuccess5,
      'focusedDay': this.focusedDay,
      'selectedDay': this.selectedDay,
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      isSuccess1: map['isSuccess1'] as bool,
      isSuccess2: map['isSuccess2'] as bool,
      isSuccess3: map['isSuccess3'] as bool,
      isSuccess4: map['isSuccess4'] as bool,
      isSuccess5: map['isSuccess5'] as bool,
      focusedDay: map['focusedDay'] as DateTime,
      selectedDay: map['selectedDay'] as DateTime,
    );
  }
}
