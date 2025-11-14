import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../model/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NotesModel notes;

  NoteWidget({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 130,
      decoration: BoxDecoration(
        color: ColorsManger.lightPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (notes.imageUrl != null && notes.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  notes.imageUrl!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // headline
                  Text(
                    notes.headline,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // description
                  Text(
                    notes.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsManger.lightGrey,
                    ),
                  ),
                  // time
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "${notes.time.hour}:${notes.time.minute.toString().padLeft(2, '0')} ${notes.time.hour >= 12 ? "PM" : "AM"}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsManger.lightGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
