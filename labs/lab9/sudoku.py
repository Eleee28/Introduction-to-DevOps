class SudokuSolver:
    def __init__(self, board):
        if len(board) != 81:
            raise ValueError("Board must be a list of 81 integers")

        # Convert the flat list into a 9x9 grid
        self.board = []
        for i in range(9):
            row = board[i * 9 : (i + 1) * 9]
            self.board.append(row)

    # To check if a number can be place we need to check: the row, the column and the 3x3 box
    def is_valid(self, row, col, num):
        for i in range(9):
            if self.board[row][i] == num or self.board[i][col] == num:
                return False
        start_row = 3 * (row // 3)
        start_col = 3 * (col // 3)
        for i in range(3):
            for j in range(3):
                if self.board[start_row + i][start_col + j] == num:
                    return False
        return True

    def solve(self):
        return self._solve_recursive()

    def _solve_recursive(self):
        for row in range(9):
            for col in range(9):
                if self.board[row][col] == 0:
                    for num in range(1, 10):
                        if self.is_valid(row, col, num):
                            self.board[row][col] = num
                            if self._solve_recursive():
                                return True
                            self.board[row][col] = 0
                    return False
        return True

    def get_solution(self):
        if self.solve():
            # Convert 2D board back to list
            list_board = []
            for row in self.board:
                for num in row:
                    list_board.append(num)
            return list_board
        else:
            return None