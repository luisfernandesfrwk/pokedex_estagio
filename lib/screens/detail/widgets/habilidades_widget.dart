import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_estagio/model/abilities_model.dart';
import 'package:pokedex_estagio/screens/detail/widgets/skeleton_container_widget.dart';
import 'package:pokedex_estagio/utils/colors_util.dart';
import 'package:pokedex_estagio/utils/func_util.dart';

class HabilidadesWidget extends StatefulWidget {
  const HabilidadesWidget(
      {Key? key,
      required this.abilities,
      required this.color,
      required this.skeletonCount})
      : super(key: key);

  final ObservableList<Abilities?> abilities;
  final Color color;
  final int skeletonCount;

  @override
  State<HabilidadesWidget> createState() => _HabilidadesWidgetState();
}

class _HabilidadesWidgetState extends State<HabilidadesWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        color: ColorsUtil.appBackground,
        child: Container(
          color: ColorsUtil.appBackground,
          child: (widget.abilities.isEmpty)
              ? _buildSkeleton(context)
              : _buildList(),
        ),
      );
    });
  }

  ListView _buildList() {
    return ListView.separated(
      itemCount: widget.abilities.length,
      separatorBuilder: (context, index) => Divider(
        color: widget.color,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              FuncUtil.capitalize(widget.abilities[index]!.name),
              style: TextStyle(color: widget.color, fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.abilities[index]!.flavorTextEntries![0].flavorText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }

  ListView _buildSkeleton(BuildContext context) => ListView.separated(
      itemCount: widget.skeletonCount,
      separatorBuilder: (context, index) => Divider(
            color: widget.color,
          ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 19,
            ),
            SkeletonContainer.title(
              width: 80,
              color: widget.color,
            ),
            const SizedBox(height: 20),
            SkeletonContainer.text(width: 300, color: widget.color),
            const SizedBox(height: 10),
            SkeletonContainer.text(width: 300, color: widget.color),
            const SizedBox(
              height: 19,
            )
          ],
        );
      });
}
