import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import scipy.signal as sig
from scipy.io import netcdf
import scipy.interpolate as interp
import seaborn as sns
import pandas as pd

sns.set_context('poster')

sns.set_style('whitegrid', {'axes.edgecolor':'0.1',
                            'legend.frameon': True,
                            'xtick.color': '.15',
                            'xtick.major.size': 5,
                            'xtick.minor.size': 0.0,
                            'xtick.direction': 'out',
                            'ytick.color': '.15',
                            'ytick.major.size': 5,
                            'ytick.minor.size': 0.0,
                            'ytick.direction': 'out',
                            'axes.axisbelow': True,
                            'axes.linewidth': 0.4,
                            })
