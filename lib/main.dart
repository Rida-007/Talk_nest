import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FakeMessagingApp());
}

class FakeMessagingApp extends StatelessWidget {
  const FakeMessagingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clickbait Messenger 🤡',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _fakeLogin() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ContactsScreen(username: _usernameController.text.trim()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.message, size: 80, color: Colors.teal),
              const SizedBox(height: 16),
              const Text(
                "Clickbait Messenger 🤡",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 12,
                        ),
                      ),
                      onPressed: _fakeLogin,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  final String username;
  ContactsScreen({super.key, required this.username});

  final List<String> contacts = [
    "Mohanlal",
    "Mammooty",
    "Dulqar Salman",
    "Tovino",
    "Prithvi Raj",
    "Fahad Fasil",
    "Nivin ",
    "Shah Rukh Khan",
    "Salman Khan",
    "Aamir Khan",
    "Amitabh Bachchan",
    "Ranbir Kapoor",
    "Deepika Padukone",
    "Priyanka Chopra Jonas",
    "Alia Bhatt",
    "Hrithik Roshan",
    "Kareena Kapoor Khan",
    "Leonardo DiCaprio",
    "Tom Cruise",
    "Robert Downey Jr.",
    "Dwayne Johnson",
    "Brad Pitt",
    "Johnny Depp",
    "Angelina Jolie",
    "Meryl Streep",
    "Scarlett Johansson",
    "Jennifer Lawrence",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(contacts[index]),
            subtitle: const Text("Tap to start chatting"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FakeChatUI(
                    contactName: contacts[index],
                    username: username,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FakeChatUI extends StatefulWidget {
  final String contactName;
  final String username;

  const FakeChatUI({
    super.key,
    required this.contactName,
    required this.username,
  });

  @override
  _FakeChatUIState createState() => _FakeChatUIState();
}

class _FakeChatUIState extends State<FakeChatUI> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool isTyping = false;
  String lastMessage = "";
  String currentTheme = "Light";

  List<String> funnyReplies = [
    "I just opened a portal to another tab 🌀",
    "Sorry, I'm updating my blender firmware.",
    "I sneezed and my phone flew away.",
    "I forgot how to type.",
    "I'm buffering…",
    "Hold on, I'm talking to a potato.",
    "I can’t reply, my keyboard is shy.",
    "Currently decoding your message with ancient runes.",
    "Oops, my thoughts got stuck in traffic.",
    "Message received by my third eye 👁️",
    "I tried to respond, but the vibe wasn’t right.",
    "The message was too emotionally charged for me.",
    "I replied in my mind. Hope you heard it.",
    "I sent the reply to the cloud… literally.",
    "Sorry, I’m in airplane mode spiritually.",
    "This conversation is being live-streamed to aliens 👽",
    "Can’t respond, I’m chasing my dreams (literally).",
    "I forgot my reply inside the fridge.",
    "I trained an AI to answer but it ghosted me.",
    "Your message got converted to binary and lost.",
    "I’m charging my sarcasm before replying.",
    "Oops! Thought I was talking to my toaster.",
    "I replied but my pet rock ate it.",
    "I sent your message to Google Translate → Morse → Emoji → Gone.",
    "I got distracted counting atoms.",
  ];

  void sendMessage() {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      lastMessage = text;
      messages.add({"sender": widget.username, "text": text});
      _controller.clear();
      isTyping = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTyping = false;
      });
    });
  }
}
