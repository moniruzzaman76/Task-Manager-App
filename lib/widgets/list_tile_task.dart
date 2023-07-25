import 'package:flutter/material.dart';

class ListTileTask extends StatelessWidget {
  const ListTileTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context,index){
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("What is the Lorem Ipsum text?"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                          ""),
                      const SizedBox(height: 15,),
                      const Text("data: 22/07/23"),
                      const SizedBox(height:15,),
                      Row(
                        children: [
                          const Chip(
                            label: Text("new",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                            backgroundColor: Colors.blue,
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.green,)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded,color: Colors.red,))

                        ],
                      )
                    ],
                  ),
                ),
              );},
          separatorBuilder: (context,index){
            return const Divider(
              height: 4,
              thickness: 1,
            );
          },

        )
    );
  }
}