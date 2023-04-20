class ReportLink {
  String? title;
  String? linkUrl;

  ReportLink({this.title, this.linkUrl});

  ReportLink.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    linkUrl = json['linkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['linkUrl'] = linkUrl;
    return data;
  }
}
