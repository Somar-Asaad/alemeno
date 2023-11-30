import 'package:alemeno/data_layer/test_data.dart';
import 'package:flutter/material.dart';

class Test {
  final String testName;
  final int numberOfTests;
  final String timeOfReport;
  final double totalPrice;
  final double discountedPrice;

  Test({
    required this.testName,
    required this.numberOfTests,
    required this.timeOfReport,
    required this.totalPrice,
    required this.discountedPrice,
  });
}

class TestsProvider with ChangeNotifier {
  final List<Test> _selectedTests = [];
  final List<Test> _addedToCartTests = [];
  DateTime? _selectedDate; // Separate date property
  String? _selectedTime; // Separate time property
  bool _hardCopySelected = false; // Property for hard copy selection

  List<Test> get selectedTests => _selectedTests;

  List<Test> get addedToCartTests => _addedToCartTests;

  DateTime? get selectedDate => _selectedDate; // Getter for date
  String? get selectedTime => _selectedTime; // Getter for time
  bool get hardCopySelected => _hardCopySelected; // Getter for hard copy selection

  TestsProvider() {
    _initializeTests();
  }

  void _initializeTests() {
    for (var testDataEntry in testsData.entries) {
      var testInfo = testDataEntry.value;
      var test = Test(
        testName: testInfo['Name']!,
        numberOfTests: int.parse(testInfo['Number_of_tests']!),
        timeOfReport: testInfo['Time_of_getting_reports']!,
        totalPrice: double.parse(testInfo['Total_Price']!),
        discountedPrice: double.parse(testInfo['After_Discount_price']!),
      );
      _selectedTests.add(test);
    }
  }

  void addTestToCart(Test test) {
    _addedToCartTests.add(test);
    notifyListeners();
  }

  void removeTestFromCart(Test test) {
    _addedToCartTests.remove(test);
    notifyListeners();
  }

  void selectDateTime(DateTime? selectedDate, String? selectedTime) {
    _selectedDate = selectedDate;
    _selectedTime = selectedTime;
    notifyListeners();
  }

  void toggleHardCopySelection() {
    _hardCopySelected = !_hardCopySelected;
    notifyListeners();
  }
}
