import 'package:flutter/widgets.dart';
import 'package:stop/score_screen/widgets/podium_item.dart';
import 'package:stop/score_screen/widgets/rank_profile_photo.dart';
import 'package:stop/score_screen/widgets/top_rank_rectangle.dart';

class TopUserWidget extends StatelessWidget {
  final String rank;
  final String name;
  final int score;
  final Color color;
  final double height;
  final MainAxisAlignment? mainAxisAlignment;

  const TopUserWidget({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.color,
    required this.height, this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
       clipBehavior: Clip.none,
      children: [  
        PodiumItem(height: height, color: color, mainAxisAlignment: mainAxisAlignment, name: name, score: score),
        const RankProfilePhoto(),
        TopRankRectangle(rank: rank)
      ],
    );
  }}