import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mad_practical/pages/story_page.dart';
import 'package:mad_practical/services/apiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? prompt;
  String? apiResponse;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late ApiService _apiService = ApiService();
  final GetIt getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    _apiService = getIt.get<ApiService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Story'),
        actions: [
          IconButton(
            icon: Icon(Icons.radio),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoryScreen()),
              );
            },
          ),
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerText(),
              SizedBox(height: 20),
              _storyForm(),
              SizedBox(height: 20),
              // Display monkey image if prompt contains "monkey", otherwise display Titanic image
              if (prompt != null)
                Image.network(prompt!.toLowerCase().contains('titanic')
                    ? 'http://192.168.10.108:4000/uploads/monkey.jpg'
                    : 'http://192.168.10.108:4000/uploads/monkey.jpg'),
              SizedBox(height: 20),
              if (apiResponse != null)
                Text(
                  '${apiResponse}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerText() {
    return Text(
      'Ask a story',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _storyForm() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your story',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a story';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  prompt = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _apiService.makeApiCall(prompt!).then((response) {
                    setState(() {
                      apiResponse =
                          response!['text']; // Set the response in state
                    });
                  });
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
