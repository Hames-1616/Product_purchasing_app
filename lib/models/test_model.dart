

class TestModel {
  final String DPrice;
  final String Name;
  final String Price;
  final String Tests;
  final bool isAdd;
  final String uid;
  TestModel({
    required this.DPrice,
    required this.Name,
    required this.Price,
    required this.Tests,
    required this.isAdd,
    required this.uid,
  });

  TestModel copyWith({
    String? DPrice,
    String? Name,
    String? Price,
    String? Tests,
    bool? isAdd,
    String? uid,
  }) {
    return TestModel(
      DPrice: DPrice ?? this.DPrice,
      Name: Name ?? this.Name,
      Price: Price ?? this.Price,
      Tests: Tests ?? this.Tests,
      isAdd: isAdd ?? this.isAdd,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'DPrice': DPrice});
    result.addAll({'Name': Name});
    result.addAll({'Price': Price});
    result.addAll({'Tests': Tests});
    result.addAll({'isAdd': isAdd});
    result.addAll({'uid': uid});
  
    return result;
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      DPrice: map['DPrice'] ?? '',
      Name: map['Name'] ?? '',
      Price: map['Price'] ?? '',
      Tests: map['Tests'] ?? '',
      isAdd: map['isAdd'] ?? false,
      uid: map['uid'] ?? '',
    );
  }


  @override
  String toString() {
    return 'TestModel(DPrice: $DPrice, Name: $Name, Price: $Price, Tests: $Tests, isAdd: $isAdd, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TestModel &&
      other.DPrice == DPrice &&
      other.Name == Name &&
      other.Price == Price &&
      other.Tests == Tests &&
      other.isAdd == isAdd &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return DPrice.hashCode ^
      Name.hashCode ^
      Price.hashCode ^
      Tests.hashCode ^
      isAdd.hashCode ^
      uid.hashCode;
  }
}
