import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  for (var argument in arguments) {
    var myDir = new Directory(argument);

    var full_html =
        """<html><head><title>Dir Listing</title></head></html><body><style>/*Taken from bettermotherfuckingwebsite.com */
body{
    margin:40px auto;
    max-width:650px;
    line-height:1.6;
    font-size:18px;
    color:#444;
    padding:0 10px
}
h1,h2,h3{
    line-height:1.2
}</style>""";

    var list = myDir.listSync(recursive: true, followLinks: false);

    for (var file in list) {
      var path = file.path;
      full_html += "<a href='$path'>$path</a>\n";
    }
    full_html += "</body></html>";
    print(full_html);
  }
}
