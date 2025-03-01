import 'package:flutter/material.dart';
import 'package:stop/custom_button.dart';
import 'package:stop/game_room/view/game_room.dart';
import 'package:stop/room_selection/widgets/dialog_header.dart';
import 'package:stop/room_selection/widgets/share_link_section.dart';
import 'package:stop/room_selection/widgets/time_limit_slider.dart';

void showRoomSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DialogHeader(text: 'Room Settings',),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Time Limit'),
                      const TimeLimitSlider(),
                      const Text('Invite Link'),
                      const SizedBox(height: 12),
                      const ShareLinkSection(),
                      const SizedBox(height: 20.0),
                      Custom3DButton(
                        text: "continue",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameScreen()),
                        ),
                        color: const Color(0xFF51B7E5),
                        textColor: Colors.white,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
  );
}