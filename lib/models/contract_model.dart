class ContractModel {
  String? chatroomid;
  Map<String, dynamic>? participants;
  String? contractpic;
 

  ContractModel(
      {this.chatroomid,
      this.participants,
      this.contractpic,
      });
  ContractModel.fromMap(Map<String, dynamic> map) {
    chatroomid = map["chatroomid"];
    participants = map["participants"];
    contractpic= map["contractpic"];
   
  }

  Map<String, dynamic> toMap() {
    return {
      "chatroomid": chatroomid,
      "participants": participants,
      "contractpic": contractpic,
      
    };
  }
}
