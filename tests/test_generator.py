import unittest
import os
import shutil
from sdk.generator import generate_themes

class TestGenerator(unittest.TestCase):
    def setUp(self):
        self.test_dir = "tests/temp_variants"
        os.makedirs(self.test_dir, exist_ok=True)

    def tearDown(self):
        shutil.rmtree(self.test_dir)

    def test_generation(self):
        count = generate_themes(self.test_dir)
        self.assertTrue(count > 0)
        self.assertTrue(os.path.exists(os.path.join(self.test_dir, "theme_red.txt")))

if __name__ == '__main__':
    unittest.main()
