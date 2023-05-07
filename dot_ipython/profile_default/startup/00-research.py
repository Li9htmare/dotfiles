import importlib
import sys


if importlib.util.find_spec('matplotlib'):
    import matplotlib.pyplot as plt


if importlib.util.find_spec('numpy'):
    import numpy as np


if importlib.util.find_spec('pandas'):
    import pandas as pd

    pd.options.display.max_columns = 100
    pd.options.display.min_rows = 20
    pd.options.display.width = None if sys.stdout.isatty() else sys.maxsize


if importlib.util.find_spec('seaborn'):
    import seaborn as sns

    sns.set_theme()


if importlib.util.find_spec('xarray'):
    import xarray as xr

    xr.set_options(display_max_rows=100)
