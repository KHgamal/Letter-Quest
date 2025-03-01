import 'package:flutter/material.dart';
import 'package:stop/custom_button.dart';
import 'package:stop/room_selection/views/room_selection.dart';
import 'package:stop/score_screen/widgets/ranking_item_widget.dart';

class LeaderboardListWidget extends StatelessWidget {
  const LeaderboardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> users = [
      {'name': 'Bagas Rizky', 'level': 4,  },
      {'name': 'Muhammad Rizky','level': 5},
      {'name': 'Nadia Putri', 'level': 6,},
      {'name': 'Faisal Kholid','level': 7 },
      {'name': 'Bagas Rizky', 'level': 4,  },
      {'name': 'Muhammad Rizky','level': 5},
      {'name': 'Nadia Putri', 'level': 6,},
      {'name': 'Faisal Kholid','level': 7 },
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: users.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final user = users[index];
                return LeaderboardItemWidget(
                  name: user['name'],
                  level: user['level'],
                );
              },
            ),
          ),
          const SizedBox( width: 16,),
          Custom3DButton(text: "Play again", onPressed: (){}, color: const Color.fromARGB(255, 83, 170, 207),
           textColor: Colors.white ,),
          const SizedBox( width: 16,),
          TextButton(onPressed: ()=>   Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RoomSelectionView()),
        ), child: const Text("Return to home" , style: TextStyle(color: Color.fromARGB(255, 134, 133, 133)),)),
          const SizedBox( width: 16,), 
        ],
      ),
    );
  }
}