import 'dart:io';

class Document {
  final String name;
  final File doc;
  final int fis;
  final int psic;
  final int prog;
  final int db;
  final int percent;
  final String description;

  Document({
    this.name,
    this.doc,
    this.fis,
    this.psic,
    this.prog,
    this.db,
    this.percent,
    this.description,
  });
}
