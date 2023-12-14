import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String content;
  final String? fontFamily;
  final double fontSize;
  final Color? textColor;
  final OwnerType ownerType;
  final String? ownerName;
  final bool showOwnerName;
  final Color? backgroundColor;

  const Message({
    super.key,
    this.content = "",
    this.fontFamily,
    this.fontSize = 16.0,
    this.textColor,
    this.ownerType = OwnerType.sender,
    this.ownerName,
    this.showOwnerName = true,
    this.backgroundColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> implements IMessageWidget {
  String get senderInitials {
    if (!widget.showOwnerName) {
      return "";
    }

    if (widget.ownerName == null || widget.ownerName!.isEmpty) return 'ME';

    try {
      if (widget.ownerName!.lastIndexOf(' ') == -1) {
        return widget.ownerName![0];
      } else {
        var lastInitial =
            widget.ownerName!.substring(widget.ownerName!.lastIndexOf(' ') + 1);

        return widget.ownerName![0] + lastInitial[0];
      }
    } catch (e) {
      return 'ME';
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.ownerType) {
      case OwnerType.receiver:
        return buildReceiver();
      case OwnerType.sender:
      default:
        return buildSender();
    }
  }

  @override
  Widget buildReceiver() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildCircleAvatar(),
        Flexible(
          child: Bubble(
            margin: const BubbleEdges.fromLTRB(10, 10, 30, 0),
            stick: true,
            nip: BubbleNip.leftTop,
            color: const Color(0xffD9D9D9),
            alignment: Alignment.topLeft,
            child: _buildContentText(TextAlign.left),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSender() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Bubble(
            margin: const BubbleEdges.fromLTRB(30, 10, 10, 0),
            stick: true,
            nip: BubbleNip.rightTop,
            color: const Color(0Xff9ED881),
            alignment: Alignment.topRight,
            child: _buildContentText(TextAlign.right),
          ),
        ),
        _buildCircleAvatar()
      ],
    );
  }

  Widget _buildContentText(TextAlign align) {
    return Text(
      widget.content,
      textAlign: align,
      style: TextStyle(
        fontSize: widget.fontSize,
        color: widget.textColor ?? Colors.black,
        fontFamily:
            widget.fontFamily ?? DefaultTextStyle.of(context).style.fontFamily,
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
      radius: 12,
      child: Text(
        senderInitials,
        style: const TextStyle(fontSize: 9),
      ),
    );
  }
}

abstract class IMessageWidget {
  Widget buildReceiver();
  Widget buildSender();
}

enum OwnerType { receiver, sender }

class ChatList extends StatelessWidget {
  /// Messages that will be shown
  final List<Message> children;

  /// ScrollController to be attached in the [ListView]
  final ScrollController? scrollController;

  /// [ListView] shrinkWrap field
  final bool shrinkWrap;

  /// Padding of the list
  final EdgeInsets padding;

  const ChatList(
      {super.key,
      this.children = const <Message>[],
      this.scrollController,
      this.shrinkWrap = true,
      this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 10)});

  @override
  Widget build(context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      controller: scrollController ?? ScrollController(),
      padding: padding,
      itemCount: children.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return children[index];
      },
    );
  }
}
