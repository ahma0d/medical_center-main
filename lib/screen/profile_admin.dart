import 'package:flutter/material.dart';

class ProfileAdmin extends StatefulWidget {
  ProfileAdmin({Key? key}) : super(key: key);

  @override
  State<ProfileAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController statController = TextEditingController();
  bool read = true;

  @override
  Widget build(BuildContext context) {
    nameController.text = "Nour Ahmad";
    emailController.text = "noor@gmai.com";
    addressController.text = "Damascus";
    statController.text = "online";
    return Scaffold(
      backgroundColor:  Color(0xffE4F9F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Admin Account " , style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                read = !read;
              });
            },
            icon: const Icon(Icons.edit, color: Colors.black,),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90.0,
                    ),
                    TextFormField(
                      autofocus: read == true ? true : false,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                      readOnly: read,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("email"),
                      ),
                      readOnly: read,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Address"),
                      ),
                      readOnly: read,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: statController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Gender"),
                      ),
                      readOnly: read,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    !read? ElevatedButton(
                      onPressed: () {},
                      child: const Text("Edit Admin"),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20,top: 80.0),
              child: const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white54,
                backgroundImage: AssetImage('assets/images/1.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
