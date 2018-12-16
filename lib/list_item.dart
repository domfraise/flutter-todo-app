import 'package:flutter/material.dart';
import 'package:tutorial/model/item.dart';
import 'package:flutter/animation.dart';

class ListItem extends StatefulWidget {
  final Function removeItem;
  final Function updateItem;
  final Item item;

  ListItem(this.item, this.removeItem, this.updateItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListItemState();
  }
}

class ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(begin: 20.0, end: 45.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((status){
      if (status == AnimationStatus.completed){
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Card(
        child: Row(
          children: <Widget>[
            Checkbox(
              onChanged: (value) {
                setState(() {
                  widget.item.isDone = value;
                  widget.updateItem(widget.item);
                });
              },
              value: widget.item.isDone,
            ),
            Expanded(
              child: Text(widget.item.message),
            ),
            MaterialButton(
              onPressed: () {
                widget.removeItem(widget.item);
              },
              child: AnimatedIcon(animation: animation,)
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedIcon extends AnimatedWidget {
  AnimatedIcon({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Icon(
      const IconData(0xe872, fontFamily: 'MaterialIcons'),
      size: animation.value,
    );
  }
}
