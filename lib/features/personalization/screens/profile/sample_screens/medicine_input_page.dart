import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart'; // For formatting the Date

class MedicationInputPage extends StatefulWidget {
  const MedicationInputPage({super.key});

  @override
  _MedicationInputPageState createState() => _MedicationInputPageState();
}

class _MedicationInputPageState extends State<MedicationInputPage> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('Medications');
  String medicineName = '';
  int numberOfPills = 0;
  String schedule = ''; // Before/After Lunch
  String timingOption = ''; // Fixed times or intervals
  int fixedTimes = 0; // For Fixed Times option
  String interval = ''; // For Interval option
  DateTime? expiryDate;

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _submitMedication() async {
    if (expiryDate == null) {
      return; // Handle no expiry date chosen
    }

    // Show confirmation dialog
    bool confirmed = await _showConfirmationDialog();

    if (confirmed) {
      // Get current number of medications to generate pill1, pill2, etc.
      DataSnapshot snapshot = await _database.get();
      int medicationCount = snapshot.children.length;
      String pillId = 'pill${medicationCount + 1}'; // Create ID like pill1, pill2, etc.

      await _database.child(pillId).set({
        'name': medicineName,
        'pills': numberOfPills,
        'schedule': schedule,
        'timing_option': timingOption,
        'fixed_times': fixedTimes,
        'interval': interval,
        'expiry_date': dateFormat.format(expiryDate!),
      });

      // Clear the form after submission
      _clearForm();
    }
  }

  Future<bool> _showConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Submission'),
        content: const Text('Do you want to submit this medication information?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    ) ?? false;
  }

  void _clearForm() {
    setState(() {
      medicineName = '';
      numberOfPills = 0;
      schedule = '';
      timingOption = '';
      fixedTimes = 0;
      interval = '';
      expiryDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Medication Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Medicine Name
              TextField(
                onChanged: (value) {
                  medicineName = value;
                },
                decoration: const InputDecoration(labelText: 'Medicine Name'),
              ),
              const SizedBox(height: 20),

              // Number of Pills
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  numberOfPills = int.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(labelText: 'Number of Pills'),
              ),
              const SizedBox(height: 20),

              // Schedule (Before/After Lunch)
              DropdownButtonFormField<String>(
                value: schedule.isNotEmpty ? schedule : null,
                items: ['Before Lunch', 'After Lunch'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    schedule = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Schedule'),
              ),
              const SizedBox(height: 20),

              // Timing Option (Fixed Times or Intervals)
              DropdownButtonFormField<String>(
                value: timingOption.isNotEmpty ? timingOption : null,
                items: ['Fixed Times', 'Intervals'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    timingOption = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Timing Option'),
              ),
              const SizedBox(height: 20),

              // If Fixed Times is selected, show the Fixed Times input field
              if (timingOption == 'Fixed Times')
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    fixedTimes = int.tryParse(value) ?? 0;
                  },
                  decoration: const InputDecoration(labelText: 'Number of Fixed Times'),
                ),

              // If Intervals is selected, show the Interval input field
              if (timingOption == 'Intervals')
                TextField(
                  onChanged: (value) {
                    interval = value;
                  },
                  decoration: const InputDecoration(labelText: 'Interval (e.g., Every 4 Hours)'),
                ),

              // Expiry Date Picker
              ListTile(
                title: Text(expiryDate == null
                    ? 'Choose Expiry Date'
                    : 'Expiry Date: ${dateFormat.format(expiryDate!)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      expiryDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: _submitMedication,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


