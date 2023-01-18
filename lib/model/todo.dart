class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        todoText: 'Jalan Jalan Pagi',
        isDone: true,
      ),
      ToDo(
        id: '02',
        todoText: 'Tugas UAS Bh Inggris',
        isDone: true,
      ),
      ToDo(
        id: '03',
        todoText: 'Olahraga',
      ),
      ToDo(
        id: '04',
        todoText: 'Pergi Ke Malang',
      ),
      ToDo(
        id: '05',
        todoText: 'Tugas buat Halaman Web',
      ),
      ToDo(
        id: '06',
        todoText: 'Buat Front End Web',
      ),
    ];
  }
}
