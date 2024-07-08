# lowLevelDataTransformation

The package will change the world of data transformation by utilizing/modifying the low-level stuff.

Developed by BAAR Team Bravo 6 (c) 2024

## Features

- High-performance data transformation.
- Utilizes Cython for speed and efficiency.
- Modular design with separate functionalities for different tasks.

## Installation

You can install the package using `pip`:

```sh
pip install lowLevelDataTransformation
```

```python
from lowLevelDataTransformation.df_to_list_of_dictionary import low_level_df_to_list_of_dict
from lowLevelDataTransformation.df_to_string import low_level_df_to_string
from lowLevelDataTransformation.string_to_df import 
import pandas as pd

sample_dataframe = pd.DataFrame({'col_1': [10, 12, 14], 'col_2': ['a', 'b', 'c']})
sample_string = 'col_1__=__10__$$__col_2__=__a__::__col_1__=__12__$$__col_2__=__b__::__col_1__=__14__$$__col_2__=__c__$$____::__'
output_list = low_level_df_to_list_of_dict.low_level_df_to_list_of_dictionary(sample_dataframe)
output_string = low_level_df_to_string.low_level_df_to_string(sample_dataframe)
output_dataframe = low_level_string_to_df.low_level_string_to_dataframe(sample_string)

```