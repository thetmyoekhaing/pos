// import 'package:intl/intl.dart'; // For date formatting

// void categorizeAndSortDates(List<DateTime> dates) {
//   // Get current date, today, and yesterday without time (only dates)
//   DateTime now = DateTime.now();
//   DateTime today = DateTime(now.year, now.month, now.day);
//   DateTime yesterday = today.subtract(const Duration(days: 1));

//   // Create separate lists for today, yesterday, and custom range
//   List<DateTime> todayDates = [];
//   List<DateTime> yesterdayDates = [];
//   List<DateTime> olderDates = [];

//   // Categorize dates into Today, Yesterday, and Older
//   for (DateTime date in dates) {
//     DateTime dateOnly = DateTime(date.year, date.month, date.day); // Strip time

//     if (dateOnly == today) {
//       todayDates.add(date);
//     } else if (dateOnly == yesterday) {
//       yesterdayDates.add(date);
//     } else {
//       olderDates.add(date);
//     }
//   }

//   // Sort each list individually
//   todayDates.sort((a, b) => a.compareTo(b)); // Ascending
//   yesterdayDates.sort((a, b) => a.compareTo(b)); // Ascending
//   olderDates.sort((a, b) => a.compareTo(b)); // Ascending

//   // Display the results
//   print("Today:");
//   for (var date in todayDates) {
//     print(DateFormat('yyyy-MM-dd').format(date));
//   }

//   print("\nYesterday:");
//   for (var date in yesterdayDates) {
//     print(DateFormat('yyyy-MM-dd').format(date));
//   }

//   print("\nOlder Dates:");
//   for (var date in olderDates) {
//     print(DateFormat('yyyy-MM-dd').format(date));
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class DateSorterApp extends StatelessWidget {
  const DateSorterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateSorterScreen(),
    );
  }
}

class DateSorterScreen extends StatefulWidget {
  const DateSorterScreen({super.key});

  @override
  _DateSorterScreenState createState() => _DateSorterScreenState();
}

class _DateSorterScreenState extends State<DateSorterScreen> {
  DateTime now = DateTime.now();
  List<DateTime> dates = [
    DateTime(2024, 9, 20), // Future
    DateTime(2022, 5, 14), // Older date
    DateTime.now(), // Today
    DateTime.now().subtract(const Duration(hours: 10)), // Today
    DateTime.now().subtract(const Duration(days: 1)), // Yesterday
    DateTime.now().subtract(const Duration(days: 2)), // Older date
  ];

  DateTimeRange? selectedDateRange;

  void categorizeAndSortDates(DateTimeRange? customRange) {
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    List<DateTime> todayDates = [];
    List<DateTime> yesterdayDates = [];
    List<DateTime> customRangeDates = [];

    for (DateTime date in dates) {
      DateTime dateOnly = DateTime(date.year, date.month, date.day);

      if (dateOnly == today) {
        todayDates.add(date);
      } else if (dateOnly == yesterday) {
        yesterdayDates.add(date);
      } else if (customRange != null &&
          (dateOnly.isAfter(
                  customRange.start.subtract(const Duration(days: 1))) &&
              dateOnly
                  .isBefore(customRange.end.add(const Duration(days: 1))))) {
        customRangeDates.add(date);
      }
    }

    // Sort the dates
    todayDates.sort((a, b) => a.compareTo(b));
    yesterdayDates.sort((a, b) => a.compareTo(b));
    customRangeDates.sort((a, b) => a.compareTo(b));

    // Print the results
    print("Today:");
    for (var date in todayDates) {
      print(DateFormat('yyyy-MM-dd').format(date));
    }

    print("\nYesterday:");
    for (var date in yesterdayDates) {
      print(DateFormat('yyyy-MM-dd').format(date));
    }

    if (customRange != null) {
      print("\nCustom Range:");
      for (var date in customRangeDates) {
        print(DateFormat('yyyy-MM-dd').format(date));
      }
    }
  }

  Future<void> pickDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
        categorizeAndSortDates(selectedDateRange);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Sorter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => pickDateRange(context),
              child: const Text('Pick Date Range'),
            ),
            if (selectedDateRange != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Selected Range: ${DateFormat('yyyy-MM-dd').format(selectedDateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(selectedDateRange!.end)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const DateSorterApp());
}
