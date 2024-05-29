import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Map<String, String>> filedata = [
    {
      'name': 'Nahusenay',
      'message':
          "Thank you for posting! I lost my keys near the park yesterday. Could you please describe any unique features of the key? I can confirm if it's mine.",
    },
    {
      'name': 'Liya Abebe',
      'message': 'Very cool',
    },
    {
      'name': 'Abel Daniel',
      'message': 'Do the keys have ',
    },
    {
      'name': 'Dagmawi Elias',
      'message': 'Your phone is not working how can I contact you',
    },
  ];

  Widget commentChild(List<Map<String, String>> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            title: Text(
              data[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(data[index]['message']!),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text('comments',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.white,letterSpacing: 1.3),) ,

          )
        
        ],
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,),style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),),
      ),
      body: Column(
        children: [
          Expanded(
            child: commentChild(filedata),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCommentBox(
              labelText: 'Add a comment...',
              errorText: 'Please enter a comment',
              sendButtonMethod: (commentText) {
                setState(() {
                  var value = {
                    'name': 'User ',
                    'message': commentText,
                  };
                  filedata.insert(0, value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommentBox extends StatelessWidget {
  final String labelText;
  final String errorText;
  final Function(String) sendButtonMethod;

  const CustomCommentBox({
    required this.labelText,
    required this.errorText,
    required this.sendButtonMethod,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.blue), // Change icon color
          onPressed: () {
            if (commentController.text.trim().isNotEmpty) {
              sendButtonMethod(commentController.text);
              commentController.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorText),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
