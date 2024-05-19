import 'package:flutter/material.dart';

class DetailsPrivate extends StatelessWidget {
  const DetailsPrivate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: AlignmentDirectional.centerEnd,
              width: 250,
              height: 300,
              child: const Image(image: AssetImage('assets/images/1.png'),),
            ),
            const SizedBox(height: 20.0,),
            const Text("Description" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.w700),),
            const SizedBox(height: 10.0,),
            const Text("Description Description Description Description Description Description Description Description Description DescriptionDescription Description Description Description"),
            const SizedBox(height: 10.0,),
            const Text("Usage" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.w700,color: Colors.grey) ,),
            const SizedBox(height: 10.0,),
            const Text("Description Description Description Description Description Description Description Description Description DescriptionDescription Description Description Description"),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text("Status " ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18.0),),
                    SizedBox(height:  8.0,),
                    Text("Waiting"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Order Number " ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18.0),),
                    SizedBox(height:  8.0,),
                    Text("10"),
                  ],
                ),
                Column(
                  children: [
                    Text("Name Laboratory" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18.0),),
                    SizedBox(height:  8.0,),
                    Text("Noor Ahmad"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Text("CreatedAt"),
            const SizedBox(height: 6.0,),
            Text("2023-08-07T15:33:47.000Z")
          ],
        ),
      ),
    );
  }
}
