import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = 'Ziad Abdellah';
  String userEmail = 'zezo@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileAvatar(imagePath: 'assets/asd.jpg'),
            SizedBox(height: 20),
            Text(
              userName,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _editProfile(context);
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          currentUserName: userName,
          currentUserEmail: userEmail,
          currentUserImage: 'assets/asd.jpg',
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        userName = updatedData['name'];
        userEmail = updatedData['email'];
        // Handle profile image update if needed
      });
    }
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imagePath;

  const ProfileAvatar({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(imagePath),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final String currentUserName;
  final String currentUserEmail;
  final String currentUserImage;

  EditProfileScreen({
    required this.currentUserName,
    required this.currentUserEmail,
    required this.currentUserImage,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late String _profileImage;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.currentUserName;
    _emailController.text = widget.currentUserEmail;
    _profileImage = widget.currentUserImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _loadNewProfileImage();
              },
              child: ProfileAvatar(imagePath: _profileImage),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final updatedData = {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'profileImage': _profileImage,
                    };
                    Navigator.pop(context, updatedData);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _loadNewProfileImage() async {
    // Implement image loading logic
  }
}
