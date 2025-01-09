class Utilities {
  static int daysDifference(String date) {
    final formattedDate = DateTime.parse(date);
    return formattedDate.difference(DateTime.now()).inDays;
  }

  static List<dynamic> filterByDeadline(List<dynamic> data, int daysAhead) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    DateTime sevenDaysFromNow = now.add(Duration(days: daysAhead));

    return data.where((item) {
      DateTime deadline = DateTime.parse(item['deadline'] as String);
      return deadline.isBefore(sevenDaysFromNow) &&
          deadline.isAfter(yesterday) &&
          item['isDone'] == false;
    }).toList();
  }
}
