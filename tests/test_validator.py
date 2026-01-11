import unittest
from sdk.validator import validate_theme

class TestValidator(unittest.TestCase):
    def test_missing_file(self):
        issues = validate_theme("non_existent_file.txt")
        self.assertTrue(len(issues) > 0)
        self.assertIn("Could not read file", issues[0])

if __name__ == '__main__':
    unittest.main()
