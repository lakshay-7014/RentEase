class ChatRoomModel {
  String? chatroomid;
  Map<String, dynamic>? participants;
  String? lastmessage;
  DateTime? lastaccessed;

  ChatRoomModel(
      {this.chatroomid,
      this.participants,
      this.lastmessage,
      this.lastaccessed});
  ChatRoomModel.fromMap(Map<String, dynamic> map) {
    chatroomid = map["chatroomid"];
    participants = map["participants"];
    lastmessage = map["lastmessage"];
    lastaccessed = map["lastaccessed"].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "chatroomid": chatroomid,
      "participants": participants,
      "lastmessage": lastmessage,
      "lastaccessed": lastaccessed
    };
  }
}
