// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';

// class ChatBubbles extends StatelessWidget {
//   const ChatBubbles({
//     super.key,
//     required this.message,
//     required this.isMe,
//     required this.userName,
//   });

//   final String message;
//   final bool isMe;
//   final String userName;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//           child: ChatBubble(
//             clipper: isMe
//                 ? ChatBubbleClipper8(type: BubbleType.sendBubble)
//                 : ChatBubbleClipper8(type: BubbleType.receiverBubble),
//             margin: const EdgeInsets.only(top: 20),
//             backGroundColor: isMe ? Colors.blue : const Color(0xffE7E7ED),
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.7,
//               ),
//               child: Column(
//                 crossAxisAlignment:
//                     isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     userName,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: isMe ? Colors.white : Colors.black,
//                     ),
//                   ),
//                   Text(
//                     message,
//                     style: TextStyle(
//                       color: isMe ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // if (isMe)
//         //   Padding(
//         //     padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
//         //     child: ChatBubble(
//         //       clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
//         //       alignment: Alignment.topRight,
//         //       margin: const EdgeInsets.only(top: 20),
//         //       backGroundColor: Colors.blue,
//         //       child: Container(
//         //         constraints: BoxConstraints(
//         //           maxWidth: MediaQuery.of(context).size.width * 0.7,
//         //         ),
//         //         child: Text(
//         //           message,
//         //           style: const TextStyle(
//         //             color: Colors.white,
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // if (!isMe)
//         //   Padding(
//         //     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//         //     child: ChatBubble(
//         //       clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
//         //       margin: const EdgeInsets.only(top: 20),
//         //       backGroundColor: const Color(0xffE7E7ED),
//         //       child: Container(
//         //         constraints: BoxConstraints(
//         //           maxWidth: MediaQuery.of(context).size.width * 0.7,
//         //         ),
//         //         child: Text(
//         //           message,
//         //           style: const TextStyle(
//         //             color: Colors.black,
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage,
      {Key? key})
      : super(key: key);

  final String message;
  final String userName;
  final bool isMe;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isMe)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 45, 0),
              child: ChatBubble(
                clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 20),
                backGroundColor: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!isMe)
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
              child: ChatBubble(
                clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
                backGroundColor: const Color(0xffE7E7ED),
                margin: const EdgeInsets.only(top: 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
      Positioned(
        top: 0,
        right: isMe ? 5 : null,
        left: isMe ? null : 5,
        child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        ),
      ),
    ]);
  }
}
