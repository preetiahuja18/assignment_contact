import 'package:flutter/material.dart';
import 'package:interview_tech/screens/addnew.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key, required this.contacts}) : super(key: key);

  List<ContactDetails> contacts;

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
             
              List<ContactDetails>? resultContacts = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNew(contacts: widget.contacts),
                ),
              );

              
              if (resultContacts != null) {
                setState(() {
                  widget.contacts = resultContacts;
                });
              }
            },
          ),
        ],
      ),
      body: _buildContactList(),
    );
  }

  Widget _buildContactList() {
    return widget.contacts.isEmpty
        ? Center(
            child: Text(
              'No contacts available. Tap the Add icon to add new contacts.',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(widget.contacts[index].phoneNumber), 
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  _deleteContact(index);
                },
                child: ListTile(
                  title: Text(widget.contacts[index].firstName),
                  subtitle: Text(widget.contacts[index].phoneNumber),
                  onTap: () {
                    
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.contacts.length,
          );
  }

  void _deleteContact(int index) {
    setState(() {
      widget.contacts.removeAt(index);
    });
  }
}

class ContactDetails {
  final String firstName;
  final String phoneNumber;

  ContactDetails({
    required this.firstName,
    required this.phoneNumber,
  });
}
