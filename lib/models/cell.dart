abstract class Cell {
  int row;
  int column;

  Cell(this.row, this.column);

  @override
  String toString() {
    return "Cell: row: $row, column: $column";
  }
}
