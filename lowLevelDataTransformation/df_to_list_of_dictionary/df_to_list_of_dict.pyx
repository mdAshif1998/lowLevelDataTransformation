# dataframe_to_cpp.pyx
import numpy as np
cimport numpy as np
import pandas as pd
from cython.parallel import prange, parallel
from libc.stdlib cimport malloc, free
import cython


cdef struct RowStruct:
    int field1
    int field2


cdef int multiply_and_allocate(int field1, int field2) nogil:
    # cdef int* result = <int*>malloc(sizeof(int))
    # if result == NULL:
    #     raise MemoryError("Failed to allocate memory")
    
    return field1 * field2


# cdef extern from "stdlib.h":
#     void* malloc(size_t size)
#     void free(void* ptr)


def df_to_list_of_dictionary(df):
    cdef object df_pd = df  # Declare as generic object and use it directly
    cdef int i
    # Initialize an empty list to store dictionaries
    cdef list dict_array = []
    cdef dict row_dict
    # Get DataFrame columns
    cdef list columns = df_pd.columns.tolist()
    cdef int column_length = len(columns)
    cdef tuple row
    # Iterate over DataFrame rows using itertuples for better performance
    for row in df_pd.itertuples(index=False, name=None):
        row_dict = {columns[i]: row[i] for i in range(column_length)}
        dict_array.append(row_dict)

    return dict_array


# @cython.boundscheck(False)
# def dataframe_to_list_of_dicts(df):
#     cdef np.ndarray[np.int_t, ndim=1] column1 = df['a'].to_numpy(dtype=np.int)
#     cdef np.ndarray[np.int_t, ndim=1] column2 = df['b'].to_numpy(dtype=np.int)

#     cdef Py_ssize_t num_rows = len(df)
#     cdef RowStruct row

#     cdef int row_index
#     cdef int* multiplication_result
#     multiplication_result = <int*>malloc(num_rows * sizeof(int))
#     if multiplication_result == NULL:
#         raise MemoryError("Failed to allocate memory")
    
#     with cython.nogil:
#         for row_index in prange(num_rows, num_threads=1000):
#             multiplication_result[row_index] = multiply_and_allocate(column1[row_index], column2[row_index])
    
#     cdef list final_result = []
#     for row_index in range(num_rows):
#         final_result.append(multiplication_result[row_index])
    
#     free(multiplication_result)
#     return final_result