import 'package:flutter/material.dart';

const String logoUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIw4OWQiV_yA9bzadlniIC80ObGNLwx97bg&s';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      title: 'BICOL REGION GENERAL HOSPITAL AND GERIATRIC MEDICAL CENTERs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}


class ScreenPlaceholder extends StatelessWidget {
  final String screenName;

  const ScreenPlaceholder({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 16),
          Text(
            screenName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String?> _dropdownValues = List.filled(9, null);
  String? _selectedServiceKey;
  String? _selectedCategoryLabel;
  String? _selectedServiceTypeLabel;
  String? _openedServiceTitle;

  final Map<String, List<String>> _servicesByKey = {
    'chief_ext': [
      'Office of the Medical Center Chief',
      'Public Information and Assistance',
      'Hospital Administration Inquiries',
    ],
    'medical_ext': [
      'Outpatient Consultation',
      'Admission for In‑Patients',
      'Specialty Clinic Scheduling',
    ],
    'medical_int': [
      'Doctors’ Internal Coordination',
      'Clinical Conference Scheduling',
      'Medical Records Review',
    ],
    'nurse_ext': [
      'Nursing Assessment for Admission',
      'Patient Vital Signs Monitoring',
      'Health Education and Counseling',
    ],
    'nurse_int': [
      'Nursing Shift Handover',
      'Ward Assignment Management',
      'Supplies and Equipment Check',
    ],
    'allied_ext': [
      'Dental Consultation and Treatment',
      'Physical Therapy Sessions',
      'Occupational Therapy Sessions',
    ],
    'ops_ext': [
      'Ambulance and Transport Requests',
      'Billing and Cashier Services',
      'Records Request and Releasing',
    ],
    'ops_int': [
      'Housekeeping and Maintenance',
      'Security and Safety Coordination',
      'Canteen and Facility Support',
    ],
    'chief_int': [
      'Feedback Evaluation and Review',
      'Complaint Resolution Meetings',
      'Internal Policy Discussion',
    ],
    'feedback': [
      'Submit Feedback or Complaint',
      'Track Submitted Feedback',
      'View Feedback Guidelines',
    ],
    'offices': [
      'Administration Office',
      'Billing Office',
      'Medical Records Office',
      'Nursing Office',
    ],
  };


  void _onDropdownChanged(int dropdownIndex, String? newValue, String screenName) {
    setState(() {
      _dropdownValues[dropdownIndex] = newValue;
      _selectedServiceKey = newValue;

      final parts = screenName.split(' - ');
      if (parts.length == 2) {
        _selectedCategoryLabel = parts[0];
        _selectedServiceTypeLabel = parts[1];
      } else {
        _selectedCategoryLabel = null;
        _selectedServiceTypeLabel = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 221, 221),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(logoUrl),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'BICOL REGION GENERAL HOSPITAL AND GERIATRIC MEDICAL CENTER',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              width: 320,
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Service Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildDropdown(
                    index: 0,
                    hint: 'Medical Center Chief Office',
                    items: const ['External Services'],
                    valueIds: const ['chief_ext'],
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    index: 1,
                    hint: 'Medical Service Division',
                    items: const ['External Services', 'Internal Services'],
                    valueIds: const ['medical_ext', 'medical_int'],
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    index: 2,
                    hint: 'Nursing Service Division',
                    items: const ['External Services', 'Internal Services'],
                    valueIds: const ['nurse_ext', 'nurse_int'],
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    index: 3,
                    hint: 'Allied Service Division',
                    items: const ['External Services'],
                    valueIds: const ['allied_ext'],
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    index: 4,
                    hint: 'Hospital Operations and Patient Support Service Division',
                    items: const ['External Services', 'Internal Services'],
                    valueIds: const ['ops_ext', 'ops_int'],
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryButton(
                    label: 'Feedback and Complaints Mechanism',
                    serviceKey: 'feedback',
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryButton(
                    label: 'List of Offices',
                    serviceKey: 'offices',
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_openedServiceTitle == null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          color: Color.fromARGB(255, 240, 248, 255),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search services...',
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                        child: Text(
                          _selectedServiceTypeLabel ?? 'Popular Services',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          _selectedCategoryLabel == null
                              ? 'Tap a service to view more details.'
                              : 'Category: $_selectedCategoryLabel',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          children: (_servicesByKey[_selectedServiceKey] ?? [
                            'Dental Consultation and Treatment',
                            'Outpatient Physical Therapy Treatment',
                            '24-hour Ambulatory Blood Pressure Monitoring (ABPM) and 24-hour Holter Examinations',
                            'Requests for X-Ray, Ultrasound, and Computerized Tomography Scan',
                            'Laboratory Services for In‑Patients',
                            'Laboratory Services for Out‑Patients',
                            'Satellite Laboratory Services',
                          ])
                              .map(
                                (title) => _buildServiceCard(
                                  title,
                                  categoryLabel: _selectedCategoryLabel,
                                  serviceTypeLabel: _selectedServiceTypeLabel,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ] else ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          color: Color.fromARGB(255, 240, 248, 255),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  _openedServiceTitle = null;
                                });
                              },
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'View',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_selectedCategoryLabel != null ||
                                  _selectedServiceTypeLabel != null)
                                Text(
                                  [
                                    if (_selectedCategoryLabel != null)
                                      _selectedCategoryLabel!,
                                    if (_selectedServiceTypeLabel != null)
                                      _selectedServiceTypeLabel!,
                                  ].join(' • '),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              const SizedBox(height: 8),
                              const Text(
                                'View',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Ulllolll',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required int index,
    required String hint,
    required List<String> items,
    required List<String> valueIds,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: _dropdownValues[index],
        hint: Text(
          hint,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        isExpanded: true,
        isDense: false,
        itemHeight: 60,
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
        items: List.generate(items.length, (i) {
          return DropdownMenuItem<String>(
            value: valueIds[i],
            child: Text(items[i]),
          );
        }),
        selectedItemBuilder: (context) {
          return List.generate(items.length, (i) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hint,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    items[i],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          });
        },
        onChanged: (value) {
          if (value == null) return;
          int pos = valueIds.indexOf(value);
          String displayName = pos >= 0 ? items[pos] : value;
          String screenName = '$hint - $displayName';
          _onDropdownChanged(index, value, screenName);
        },
      ),
    );
  }

  Widget _buildCategoryButton({
    required String label,
    required String serviceKey,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          _selectedServiceKey = serviceKey;
          _selectedCategoryLabel = label;
          _selectedServiceTypeLabel = null;
          _openedServiceTitle = null;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    String title, {
    String? categoryLabel,
    String? serviceTypeLabel,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            _openedServiceTitle = title;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.local_hospital_rounded, color: Colors.blue),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'View PDF pot AS',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
