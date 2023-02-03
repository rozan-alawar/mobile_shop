class FAQsResponse {
  bool? status;
  String? message;
  FAQs? data;

  FAQsResponse({this.status, this.message, this.data});

  FAQsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? FAQs.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FAQs {
  List<Quastions>? data;

  FAQs({this.data});

  FAQs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Quastions>[];
      json['data'].forEach((v) {
        data!.add(Quastions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quastions {
  int? id;
  String? question;
  String? answer;

  Quastions({this.id, this.question, this.answer});

  Quastions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
