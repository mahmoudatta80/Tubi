import 'package:flutter/material.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Consumer<MyProvider>(
            builder: (context, myProvider, child) => Stack(
              alignment: Alignment.bottomRight,
              children: [
                myProvider.image == null
                    ? CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage: const AssetImage(
                          'assets/images/person.jpg',
                        ),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage: FileImage(myProvider.image!),
                      ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(
                      .5,
                    ),
                  ),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onPressed: myProvider.uploadImage,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Profile',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  cursorColor: Theme.of(context).primaryColorLight,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    label: Text(
                      'User Name',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    fillColor: Theme.of(context).primaryColorLight,
                    focusColor: Theme.of(context).primaryColorLight,
                    hoverColor: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Theme.of(context).primaryColorLight,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    label: Text(
                      'Email',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    fillColor: Theme.of(context).primaryColorLight,
                    focusColor: Theme.of(context).primaryColorLight,
                    hoverColor: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneController,
                  cursorColor: Theme.of(context).primaryColorLight,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    label: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    fillColor: Theme.of(context).primaryColorLight,
                    focusColor: Theme.of(context).primaryColorLight,
                    hoverColor: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColorLight,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
