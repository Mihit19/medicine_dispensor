import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../authentication/controllers/user/user_controller.dart';
import 'medicine_input_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String medicineDispensedStatus = "No Medicine";
  String medicineTakenStatus = "";
  String requestStatus = "";
  get controller => null;

  @override
  void initState() {
    super.initState();

    // Listen to changes in Firebase Database
    _database.child('Dispenser').onValue.listen((event) {
      setState(() {
        medicineDispensedStatus = (event.snapshot.value as String?) ?? 'Unknown';
      });
    });
    _database.child('MedicineTaken').onValue.listen((event) {
      setState(() {
        medicineTakenStatus = (event.snapshot.value as String?) ?? 'Unknown';
      });
    });
    _database.child('Request').onValue.listen((event) {
      setState(() {
        requestStatus = (event.snapshot.value as String?) ?? 'Unknown';
      });
    });
  }

  void _updateMedicineStatus(String status) {
    _database.child('MedicineTaken').set(status);
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added to space the widgets
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Text("Medicine Dispensed : $medicineDispensedStatus",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _updateMedicineStatus("Medicine Taken");
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Medicine Taken"),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                Text(requestStatus,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),

            // Button to navigate to Medication Input Page
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Medication Input Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicationInputPage()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Add New Medication'),
                  ), // Make it full width
                ),
                ElevatedButton(
                  onPressed: () => logout(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('log out'),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

void logout(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Navigate the user to the login screen after successful sign out
    Navigator.of(context).pushReplacementNamed('/login');
  } catch (e) {
    print("Error signing out: $e");
  }
}
