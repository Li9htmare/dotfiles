import importlib
import sys


if importlib.util.find_spec('pandas'):
    import pandas as pd

    pd.options.display.max_columns = 100
    pd.options.display.min_rows = 20
    pd.options.display.width = None if sys.stdout.isatty() else sys.maxsize
