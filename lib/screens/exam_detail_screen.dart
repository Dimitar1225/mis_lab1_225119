import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String _getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) return "Испитот помина!";

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "Преостануваат $days дена и $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final timeRemaining = _getTimeRemaining();

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blueAccent),
                    const SizedBox(width: 10),
                    Text(DateFormat('dd.MM.yyyy').format(exam.dateTime),
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.blueAccent),
                    const SizedBox(width: 10),
                    Text(DateFormat('HH:mm').format(exam.dateTime),
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.meeting_room, color: Colors.blueAccent),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(exam.rooms.join(', '),
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    timeRemaining,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
