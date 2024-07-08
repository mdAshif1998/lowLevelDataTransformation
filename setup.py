import os

import numpy as np

from os.path import join
from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize


directory_path = os.path.dirname(
    os.path.abspath(__file__)
    )


with open(os.path.join(directory_path, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()


ext_data = {
    'lowLevelDataTransformation.df_to_list_of_dictionary.df_to_list_of_dict': {
        'sources': [join(directory_path, 'lowLevelDataTransformation', 'df_to_list_of_dictionary', 'df_to_list_of_dict.pyx')],
        'include': [np.get_include()]},
    'lowLevelDataTransformation.df_to_string.df_to_string': {
        'sources': [join(directory_path, 'lowLevelDataTransformation', 'df_to_string', 'df_to_string.pyx')],
        'include': [np.get_include()]},
    'lowLevelDataTransformation.string_to_df.string_to_df': {
        'sources': [join(directory_path, 'lowLevelDataTransformation', 'string_to_df', 'string_to_df.pyx')],
        'include': [np.get_include()]}
}


extensions = []

for name, data in ext_data.items():

    sources = data['sources']
    include = data.get('include', [])

    obj = Extension(
        name,
        sources=sources,
        include_dirs=include
    )
    
    extensions.append(obj)

setup(
    name='lowLevelDataTransformation',
    version='0.0.2',
    author='BAAR Team Bravo 6',
    author_email='ashif.ali@baar.ai',
    url='https://github.com/mdAshif1998/lowLevelDataTransformation',
    description='The package will change the world of data transformation by utilizing/modifying the low-level stuff.',
    long_description=long_description,
    long_description_content_type='text/markdown',
    packages=find_packages(),
    ext_modules=cythonize(extensions),
    install_requires=[
        'Cython>=0.29.21',
        'numpy>=1.18.1',
        'pandas>=1.5.2'
    ],
    classifiers=[
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.8',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
