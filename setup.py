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
    'LLDT.df_to_list_of_dictionary.df_to_list_of_dict': {
        'sources': [join(directory_path, 'LLDT', 'df_to_list_of_dictionary', 'df_to_list_of_dict.pyx')],
        'include': [np.get_include()]},
    'LLDT.df_to_string.df_to_string': {
        'sources': [join(directory_path, 'LLDT', 'df_to_string', 'df_to_string.pyx')],
        'include': [np.get_include()]},
    'LLDT.string_to_df.string_to_df': {
        'sources': [join(directory_path, 'LLDT', 'string_to_df', 'string_to_df.pyx')],
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
    name='LLDT',
    version='0.0.7',
    author='Md Ashif Ali',
    author_email='mdashifali.dml25@iiitb.net',
    url='https://github.com/mdAshif1998/lowLevelDataTransformation/tree/master',
    description='The package will change the world of data transformation by utilizing/modifying the low-level stuff.',
    long_description=long_description,
    long_description_content_type='text/markdown',
    packages=find_packages(),
    ext_modules=cythonize(extensions),
    keywords=['python', 'data', 'transformation', 'cython'],
    install_requires=[
        'Cython',
        'numpy',
        'pandas'
    ],
    
    classifiers=[
        'Intended Audience :: Developers',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10',
        'Programming Language :: Python :: 3.11',
        'Programming Language :: Python :: 3.12',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Topic :: Utilities'
    ],
    python_requires='>=3.7',
)
