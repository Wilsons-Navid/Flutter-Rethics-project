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
        primaryColor: Color(0xFF1A237E), // Deep Blue
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF3F51B5), // Indigo
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E)),
          displayMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E)),
          bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF333333)),
          labelLarge: TextStyle(
              fontSize: 16.0,
              color: Colors.white), // Changed from 'button' to 'labelLarge'
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3F51B5),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
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
      duration: const Duration(seconds: 2),
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
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: buildDrawer(context),
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Theme.of(context).primaryColor, Colors.white],
              stops: [0.0, 0.3],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        'RETHICS: 24/7 Advanced Cybersecurity Solutions For All. Call us for any security incident from hacked social media accounts to data breaches',
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        'Rethics mission is to protect  individuals, as well as small and medium size businesses in Africa with state-of-the-art digital security.',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: buildInfoCard(),
                    ),
                    SizedBox(height: 24),
                    buildElevatedButton(
                        Icons.bar_chart,
                        'Cybersecurity Insights',
                        context,
                        CybercrimeGrowthPage()),
                    SizedBox(height: 16),
                    buildElevatedButton(Icons.security, 'Our Services', context,
                        ServicesPage()),
                    SizedBox(height: 16),
                    buildElevatedButton(Icons.contact_phone, 'Contact Us',
                        context, EmergencyContactPage()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'RETHICS - Your digital Bodyguard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildDrawerItem(Icons.home, 'Home', context, HomePage()),
            buildDrawerItem(Icons.bar_chart, 'Cybersecurity Insights', context,
                CybercrimeGrowthPage()),
            buildDrawerItem(
                Icons.security, 'Our Services', context, ServicesPage()),
            buildDrawerItem(Icons.recommend, 'Recommendations', context,
                RecommendationsPage()),
            buildDrawerItem(
                Icons.contact_phone,
                'Contact Us Or Report Cybercrime',
                context,
                EmergencyContactPage()),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(
      IconData icon, String title, BuildContext context, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
      title: Text(title, style: TextStyle(color: Color(0xFF333333))),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'RETHICS  goal is to make sure everyone is safe on the internet, and we do so by  delivering cutting-edge cybersecurity solutions to protect your digital assets and maintain business continuity.',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
      IconData icon, String label, BuildContext context, Widget page) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
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
        title: Text('Cybersecurity Insights'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).primaryColor, Colors.white],
            stops: [0.0, 0.3],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Cybersecurity Landscape',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'The cybersecurity landscape is evolving rapidly. Here are some key insights:',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildInsightCard(context, '300%',
                      'Increase in ransomware attacks since 2019'),
                  SizedBox(height: 16),
                  buildInsightCard(context, '\$6 Trillion',
                      'Estimated global cybercrime costs by 2021'),
                  SizedBox(height: 16),
                  buildInsightCard(context, '95%',
                      'Of cybersecurity breaches are due to human error'),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'These statistics highlight the critical need for robust cybersecurity measures in today\'s digital landscape. Organizations must stay vigilant and proactive in their approach to protect against ever-evolving cyber threats.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInsightCard(
      BuildContext context, String statistic, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              statistic,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).primaryColor, Colors.white],
            stops: [0.0, 0.3],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Comprehensive Cybersecurity Solutions',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildServiceCard(
                    context,
                    Icons.security,
                    'Threat Detection & Response',
                    'Our advanced AI-powered systems detect and neutralize threats in real-time, providing 24/7 protection for your digital assets.',
                  ),
                  SizedBox(height: 16),
                  buildServiceCard(
                    context,
                    Icons.lock,
                    'Data Encryption',
                    'We implement state-of-the-art encryption protocols to secure your sensitive data, ensuring confidentiality and integrity at all times.',
                  ),
                  SizedBox(height: 16),
                  buildServiceCard(
                    context,
                    Icons.people,
                    'Security Awareness Training',
                    'Our comprehensive training programs create a culture of cybersecurity awareness, empowering your employees to be the first line of defense against cyber threats.',
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'At RETHICS, we tailor our services to meet the unique needs of each client, ensuring robust protection against evolving cyber threats.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildServiceCard(
      BuildContext context, IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).primaryColor, Colors.white],
            stops: [0.0, 0.3],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Best Practices for Cybersecurity',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildRecommendationCard(
                    context,
                    Icons.vpn_key,
                    'Multi-Factor Authentication',
                    'Implement MFA across all systems to add an extra layer of security. This significantly reduces the risk of unauthorized access, even if passwords are compromised.',
                  ),
                  SizedBox(height: 16),
                  buildRecommendationCard(
                    context,
                    Icons.update,
                    'Regular Software Updates',
                    'Keep all software and systems up-to-date to patch known vulnerabilities. Automated updates can help ensure your systems are always protected against the latest threats.',
                  ),
                  SizedBox(height: 16),
                  buildRecommendationCard(
                    context,
                    Icons.backup,
                    'Data Backup & Recovery',
                    'Maintain regular backups and test your recovery process periodically. This ensures business continuity in case of data loss or ransomware attacks.',
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Implementing these best practices can significantly enhance your organization\'s cybersecurity posture. Remember, cybersecurity is an ongoing process that requires constant vigilance and adaptation.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRecommendationCard(
      BuildContext context, IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).primaryColor, Colors.white],
            stops: [0.0, 0.3],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'Need Assistance?',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'Our team of cybersecurity experts is available 24/7 to assist you with any concerns or emergencies.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.phone),
                  label: Text('Call Our Support Team'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: _makePhoneCall,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.email),
                  label: Text('Email Us'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: _sendEmail,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'For non-urgent inquiries, please allow up to 24 hours for a response. For immediate assistance, please use the phone option.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _makePhoneCall() async {
    final phoneUrl =
        Uri.parse("tel:+237693850042"); // Replace with actual phone number
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  void _sendEmail() async {
    final emailUrl =
        Uri.parse("mailto:support@rethics.com"); // Replace with actual email
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }
}
