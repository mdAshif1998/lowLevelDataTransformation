# cython: language_level=3
# df_to_string.pyx
# cython: boundscheck=False, wraparound=False, nonecheck=False, cdivision=True
import pandas as pd
import json
cimport cython
from pandas.core.frame import DataFrame

@cython.boundscheck(False)
@cython.wraparound(False)
@cython.nonecheck(False)


def df_to_string(dataframe):
    cdef list list_of_dict, modified_list
    cdef dict item
    cdef object key, value
    cdef str output
    try:
        list_of_dict = dataframe.to_dict(orient='records')

        # modified_list = []
        # for item in list_of_dict:
        #     parts = []
        #     for key, value in item.items():
        #         parts.append(f"{key}__=__{value}")
        #     modified_list.append("__$$__".join(parts))
        modified_list = ["__$$__".join([f"{key}__=__{value}" for key, value in item.items()]) for item in list_of_dict]
        output = "__::__".join(modified_list)
        return output
    except Exception as conversion_exception:
        # Optionally, you can print or log the exception for debugging purposes
        print(f"Conversion Exception: {conversion_exception}", flush=True)
        return ""