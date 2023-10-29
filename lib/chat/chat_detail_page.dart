import 'package:flutter/material.dart';
import 'message.dart';

class ChatDetailPage extends StatelessWidget {
  final MessageData message;

  ChatDetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messageData.length,
              itemBuilder: (context, index) {
                final currentMessage = messageData[index];
                final isMyMessage = currentMessage.type == MessageType.CHAT;

                return MessageWidget(
                  message: currentMessage,
                  isMyMessage: isMyMessage,
                );
              },
            ),
          ),
          InputField(),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final MessageData message;
  final bool isMyMessage;

  MessageWidget({required this.message, required this.isMyMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMyMessage)
              Text(
                message.title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Text(
              message.subTitle,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Time: ${message.time}',
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Implement message sending logic here
            },
          ),
        ],
      ),
    );
  }
}
