class MessageModel {
  String? messageid;
  String? sender;
  String? text;
  DateTime? createdon;
  bool? seen;
 MessageModel({this.createdon,this.messageid,this.seen,this.sender,this.text});
  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
    createdon = map["createdon"].toDate();
    seen = map["seen"];
    messageid = map["messageid"];
  }

  Map<String, dynamic> tomap() {
    return {
      "sender": sender,
      "text": text,
      "createdon": createdon,
      "seen": seen,
      "messageid":messageid,
    };
  }
}
