class DataModel {
  int currentSecond;
  int randomNumber;
  int attempts;
  int successCount;
  int failureCount;
  bool valueGenerated;

  DataModel(
      {required this.currentSecond,
      required this.randomNumber,
      required this.attempts,
      required this.successCount,
      required this.failureCount,
      required this.valueGenerated});
}
