import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RethicsApp());
}

class RethicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RETHICS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.yellow[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RETHICS', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 4,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              child: Text(
                'RETHICS Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildDrawerItem(Icons.home, 'Home', context, HomePage()),
            buildDrawerItem(Icons.trending_up, 'Cybercrime Growth', context, CybercrimeGrowthPage()),
            buildDrawerItem(Icons.map, 'Cybercrimes in Africa', context, AfricanCybercrimePage()),
            buildDrawerItem(Icons.report, 'Report a Cybercrime', context, ReportPage()),
            buildDrawerItem(Icons.emergency, 'Emergency Contact', context, EmergencyContactPage()),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'RETHICS: Your Digital Police',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800]),
                ),
                SizedBox(height: 16),
                Text(
                  'In a world where cybercrime is growing at an alarming rate, RETHICS stands as your digital police force, ready to protect and serve in the cyber realm.',
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
                ),
                SizedBox(height: 16),
                buildInfoCard(),
                SizedBox(height: 24),
                buildElevatedButton(Icons.bar_chart, 'View Cybercrime Growth Statistics', context, CybercrimeGrowthPage()),
                SizedBox(height: 16),
                buildElevatedButton(Icons.public, 'Cybercrimes in Africa', context, AfricanCybercrimePage()),
                SizedBox(height: 16),
                buildElevatedButton(Icons.emergency, 'Emergency Contact', context, EmergencyContactPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, BuildContext context, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey[800]),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Card buildInfoCard() {
    return Card(
      elevation: 4,
      color: Colors.blueGrey[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Cybercrime is escalating rapidly. That\'s why RETHICS exists - to be your guardian in the digital world.',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800]),
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(IconData icon, String label, BuildContext context, Widget page) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[700],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CybercrimeGrowthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybercrime Growth'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cybercrime Growth Statistics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Cybercrime has been increasing at an unprecedented rate. Here are some key statistics:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '- 2022 saw a 30% increase in cyber attacks globally.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Financial losses from cybercrime are estimated at \$1 trillion annually.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Ransomware attacks increased by 150% last year.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class AfricanCybercrimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybercrimes in Africa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cybercrimes in Africa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Africa is facing unique challenges in the fight against cybercrime:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '- Lack of cybersecurity infrastructure.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Increasing cases of online fraud and scams.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Efforts are underway to improve regional cooperation.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report a Cybercrime'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextFormField(_nameController, 'Name', 'Please enter your name'),
              SizedBox(height: 16),
              buildTextFormField(_emailController, 'Email', 'Please enter your email', TextInputType.emailAddress),
              SizedBox(height: 16),
              buildTextFormField(_descriptionController, 'Description of the Cybercrime', 'Please describe the cybercrime', 
              TextInputType.multiline,),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Report submitted')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(TextEditingController controller, String label, String validationMessage, [TextInputType keyboardType = TextInputType.text, int maxLines = 1]) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

class EmergencyContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Need Immediate Assistance?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.phone),
              label: Text('Call Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: _makePhoneCall,
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall() async {
    final phoneUrl = Uri.parse("tel:1234567890"); // Replace with actual phone number
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }
}