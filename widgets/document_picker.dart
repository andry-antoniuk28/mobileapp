import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class DocumentPicker extends StatefulWidget {
  @override
  _DocumentPickerState createState() => _DocumentPickerState();
}

class _DocumentPickerState extends State<DocumentPicker> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;
  TextEditingController _controller = new TextEditingController();
  bool selected = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      try {
        _paths = null;
        _path = await FilePicker.getFilePath(
            type: _pickingType, fileExtension: _extension);
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;

      setState(() {
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null
                ? _paths.keys.toString()
                : '...';
        selected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.upload_file),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: selected
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    _fileName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                )
              : const Text(
                  'Завантажити документ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
          onTap: () {
            _openFileExplorer();
          },
        ),
      ],
    );
  }
}
