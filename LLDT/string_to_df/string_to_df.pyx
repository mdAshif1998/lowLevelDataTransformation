# cython: language_level=3
# cython: boundscheck=False
# cython: wraparound=False
# cython: nonecheck=False

import cython
from cython.parallel import prange
import pandas as pd


@cython.boundscheck(False)
@cython.wraparound(False)
def string_to_df(str input_string):
    
    cdef list rows = input_string.split('__::__')
    cdef list data = []
    cdef object key, value
    cdef list pair
    cdef dict temp_dict
    cdef str col_value_map
    try:
        if "__::__" in input_string:
            for row in rows:
                if "__$$__" in row:
                    pair = row.split('__$$__')
                    
                    temp_dict = {}
                    for col_value_map in pair:
                        if '__=__' in col_value_map:
                            key = col_value_map.split('__=__')[0]
                            value = col_value_map.split('__=__')[1]
                            temp_dict[key] = value
                    
                    data.append(temp_dict)
        elif "__$$__" in input_string:
            pair = input_string.split('__$$__')
            temp_dict = {}
            for col_value_map in pair:
                if '__=__' in col_value_map:
                    key = col_value_map.split('__=__')[0]
                    value = col_value_map.split('__=__')[1]
                    temp_dict[key] = value
            
            data.append(temp_dict)
        elif "__=__" in input_string:
            temp_dict = {}
            key = input_string.split('__=__')[0]
            value = input_string.split('__=__')[1]
            temp_dict[key] = value
            data.append(temp_dict)
        return pd.DataFrame(data)
    except Exception as conversion_exception:
        print(f"Conversion Exception: {str(conversion_exception)}", flush=True)
        return pd.DataFrame()
