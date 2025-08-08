# LLDT

The package will change the world of data transformation by utilizing/modifying the low-level stuff.

Developed by Md Ashif Ali (c) 2025

## Features

- High-performance data transformation.
- Utilizes Cython for speed and efficiency.
- Modular design with separate functionalities for different tasks.

## Installation

You can install the package using `pip`:

```sh
pip install LLDT
```

```python
from LLDT.df_to_list_of_dictionary.df_to_list_of_dict import df_to_list_of_dictionary
from LLDT.df_to_string.df_to_string import df_to_string
from LLDT.string_to_df.string_to_df import string_to_df
import pandas as pd

sample_dataframe = pd.DataFrame({'col_1': [10, 12, 14], 'col_2': ['a', 'b', 'c']})
sample_string = 'col_1__=__10__$$__col_2__=__a__::__col_1__=__12__$$__col_2__=__b__::__col_1__=__14__$$__col_2__=__c__$$____::__'
output_list = df_to_list_of_dictionary(sample_dataframe)
output_string = df_to_string(sample_dataframe)
output_dataframe = string_to_df(sample_string)

```