import 'dart:html';

void main() {
  final input = querySelector('#taskInput') as InputElement;
  final addBtn = querySelector('#addBtn') as ButtonElement;
  final taskList = querySelector('#taskList') as DivElement;

  addBtn.onClick.listen((event) {
    final text = input.value?.trim();

    if (text == null || text.isEmpty) return;

    // Create task element
    final taskDiv = DivElement();
    taskDiv.classes.add('task');

    // Task text
    final span = SpanElement()..text = text;

    // Delete button
    final deleteBtn = ButtonElement()
      ..text = 'X'
      ..classes.add('delete-btn');

    // Toggle done on click
    span.onClick.listen((_) {
      taskDiv.classes.toggle('done');
    });

    // Delete task
    deleteBtn.onClick.listen((_) {
      taskDiv.remove();
    });

    // Add elements
    taskDiv.append(deleteBtn);
    taskDiv.append(span);

    taskList.append(taskDiv);

    // Clear input
    input.value = '';

    // 🔥 Trigger animation (important trick)
    Future.delayed(Duration(milliseconds: 10), () {
      taskDiv.classes.add('show');
    });
  });

  // BONUS: Enter key support
  input.onKeyPress.listen((event) {
    if (event.key == 'Enter') {
      addBtn.click();
    }
  });
}