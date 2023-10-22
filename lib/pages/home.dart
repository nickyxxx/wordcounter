import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController = TextEditingController();
  String message = '';

  void countWords() {
    String enteredText = _textEditingController.text;
    if (enteredText.isEmpty) {
      setState(() {
        message = 'Text field is empty. Please, enter some text';
      });
    } else {
      List<String> words = enteredText.split(RegExp(r'[ ,.]'));
      words.removeWhere((word) => word.isEmpty);
      setState(() {
        message = 'Word Count: ${words.length}';
      });
    }
  }

  void clearText() {
    _textEditingController.clear();
    setState(() {
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: Text('Word Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                ),
              ),
              SizedBox(height: 16.0),
              Text(message),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                    onPressed: countWords,
                    child: Text('Count'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clearText,
        child: Text('Clear'),
        backgroundColor: Colors.grey[500],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
