import Cocoa

/*
 Subscripts can now declare default arguments. (59012048)
*/

// (Structure) Matrix

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int = 0, column: Int = 0) -> Double { // New feature!!!
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 4, columns: 3)
matrix[] // 0 // New feature!!!
matrix[] = 6.0 // New feature!!!
matrix[0, 0] // 6
matrix[] // 6 // New feature!!!
