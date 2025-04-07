# Lab 9 - Software Unit Testing
For this lab, we will set uo unit testing for a [sudoku](https://en.wikipedia.org/wiki/Sudoku) solver using `unittest`, the unit testing framework built into the Python standard library.

To use `unittest`, you must:
- Import the `unittest` module
- Create a class that us a subclass of `unittest.TestCase`
- For each thing you need to test, create a method in this class
- Inside each methods, use the methods built in to `unittest.TestCase` ti verify that the codebase behaves as expected.

A simple example, from the [`unittest.TestCase` documentation](https://docs.python.org/3/library/unittest.html), can be seen below:

~~~ python
import unittest

class TestStringMethods(unittest.TestCase):
	def test_upper(self):
		self.assertEqual('foo'.upper(), 'FOO')

	def test_isupper(self):
		self.assertTrue('FOO'.isupper())
		self.assertFalse('Foo'.isupper())

	def test_split(self):
		s = 'hello world'
		self.assertEqual(s.split(), ['hello', 'world'])
		# check that s.split fails when
		# the separator is not a string
		with self.assertRaises(TypeError):
			s.split(2)

if __name__ == '__main__':
	unittest.main()
~~~

This lab will consist of three parts:

- Developing (or finding) a Python function that can solve the logic game sudoku, allowing users to enter the game in the form of list representing the initial board state, solve the game and return the result (again in the form of a list).

- Write unit tests for the programme to test that it works correctly. These tests should use Python's `unittest` module to test the code on a selection of real sudoku puzzles to make sure that it works correctly.

- Finally, commit your code to a repo on GitHub, and set up a GitHub actions workflow to run the tests every time a new commit is made to the repo.

## Solving Sudoku
Although writing a sudoku solver sounds like a difficult task, there are many good existing implementations that you can base your code on. For example, [Rosetta Code has a number of implementations on Python](https://rosettacode.org/wiki/Sudoku#Python) you can choose from. Note that you might need to make a few minor modifications to the code: for example, you might want to wrap the programme in a function which will take the board state list as input and return a board state as output.

Test that the function works yourself: for example, write [this](https://en.wikipedia.org/wiki/Sudoku#/media/File:Sudoku_Puzzle_by_L2G-20050714_standardized_layout.svg) sudoku board as a Python list, feed it to the function, and verify that it returns the [correct solution](https://en.wikipedia.org/wiki/Sudoku#/media/File:Sudoku_Puzzle_by_L2G-20050714_solution_standardized_layout.svg). Also, check what happens if you feed the function as invalid (unsolvable) sudoku board. If the code crashes when given an invalid input, try modifying it to fail gracefully (e.g. by having it throw and exception, or return a `None` or some other value indicating that a solution cannot be found).

[Unsolvable Sudoku Examples](https://www.sudokudragon.com/unsolvable.htm)

## Writing unit tests for your function
Next, write unit tests for your function to automatically verify that it works. For this, you should write at least **six** unit tests using the `unittest` library. You already have two: the test included with the code, and the test linked to on Wikipedia. You can create more tests by using an [online sudoku game](https://sudoku.com/) to get example games, and use an [online sudoku solver](https://anysudokusolver.com/) to get the solution. Write unit tests to verify that your function can solve these also.

In addition, write some unit tests to verify that the code correctly handles invalid inputs. You should include at least **one** test of this type. If your function returns a `None` in this case verify that the `None` value is returned here. If you are throwing an exception, use the [`TestCase.assertRaises()`] method to verify this.

## Testing automatically using GitHub Actions
Create a GitHub repo and commit your code to it. Create a GitHub Actions workflow as we did in previous labs, but rather than building your code, make this action run the unit tests. Thus, your repo must have a minimum of three things in the root:

- Your Python sudoku solver in a file (e.g. *sudoku.py*)
- The unit tests for the solver (e.g. *test_sudoku.py*), which should import the *sudoku.py* file
- A `.github` directory, which should contain your workflow YAML file that will run the tests in *test_sudoku.py*