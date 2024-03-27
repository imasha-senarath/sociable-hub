import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociable_hub/components/app_drawer.dart';
import 'package:sociable_hub/components/app_post_button.dart';
import 'package:sociable_hub/components/app_textfield.dart';
import 'package:sociable_hub/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController addPostController = TextEditingController();
  FirestoreDatabase database = FirestoreDatabase();

  void logout() async {
    FirebaseAuth.instance.signOut();
  }

  void post() {
    if (addPostController.text.isNotEmpty) {
      String msg = addPostController.text;
      database.addPost(msg);
      addPostController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Social Hub"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                      hintText: "Say something...",
                      controller: addPostController,
                      obscureText: false),
                ),
                AppPostButton(onTap: post)
              ],
            ),
          ),
          StreamBuilder(
              stream: database.getPostStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final posts = snapshot.data?.docs;

                if (snapshot.data == null || posts!.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No Posts..."),
                    ),
                  );
                }

                return Expanded(
                    child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          String msg = post['message'];
                          String email = post['userEmail'];
                          return Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: ListTile(
                                title: Text(msg),
                                subtitle: Text(email, style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary
                                ),),
                              ),
                            ),
                          );
                        }));
              }),
        ],
      ),
    );
  }
}
