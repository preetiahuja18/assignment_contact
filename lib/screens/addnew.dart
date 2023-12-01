import 'package:flutter/material.dart';
import 'package:interview_tech/screens/contact.dart';

class AddNew extends StatefulWidget {
  final List<ContactDetails> contacts;

  const AddNew({Key? key, required this.contacts}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                 
                  widget.contacts.add(ContactDetails(
                    firstName: firstNameController.text,
                    phoneNumber: phoneNumberController.text,
                  ));

                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactScreen(contacts: widget.contacts),
                    ),
                  );

                  
                  firstNameController.clear();
                  lastNameController.clear();
                  phoneNumberController.clear();
                },
                child: Text('Save Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
