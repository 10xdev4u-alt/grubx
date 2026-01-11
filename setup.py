from setuptools import setup, find_packages

setup(
    name="princetheme-sdk",
    version="1.0.1",
    description="The Enterprise Grade SDK for GRUB Theming",
    author="PrinceTheProgrammer",
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'princetheme=sdk.cli:main',
        ],
    },
)
