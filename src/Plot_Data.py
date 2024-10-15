#------------------------------------------------------------------------------
# Canadian Institute for Theoretical Astrophysics, PhD Student
#------------------------------------------------------------------------------
#
# MODULE:  Initialization
#
#> @mike-power666
#> Michael T. Power
#
# DESCRIPTION: 
#>  This module should be included in essentially every subroutine, function, 
#>  module, and program. It contains all kind parameters and every physical
#>  constant which a code may need (this will be updated as I require more).
#>  I've included both the MKS and CGS systems.
#
# REVISION HISTORY:
# 08/10/2024 - Initial Version
# TODO_dd_mmm_yyyy - TODO_describe_appropriate_changes - TODO_name
#------------------------------------------------------------------------------


import pandas as pd
import matplotlib.pyplot as plt

# Function to plot a variable vs time
def plot_variable(data, time_column, variable_column, ylabel, title, save_as):
    plt.figure(figsize=(10, 6))
    plt.plot(data[time_column], data[variable_column], label=variable_column)
    plt.xlabel('Time')
    plt.ylabel(ylabel)
    plt.title(title)
    plt.legend()
    plt.grid()
    plt.savefig(save_as)
    plt.close()

# Load the data file into a pandas DataFrame
data = pd.read_csv('output_data.txt')

# List of variables to plot vs time
variables = [
    ('x1', 'Position (x1)', 'Position x1 vs Time', 'x1_vs_time.png'),
    ('x2', 'Position (x2)', 'Position x2 vs Time', 'x2_vs_time.png'),
    ('x3', 'Position (x3)', 'Position x3 vs Time', 'x3_vs_time.png'),
    ('Distance', 'Distance', 'Distance vs Time', 'distance_vs_time.png'),
    ('u1', '4-Velocity (u1)', '4-Velocity u1 vs Time', 'u1_vs_time.png'),
    ('u2', '4-Velocity (u2)', '4-Velocity u2 vs Time', 'u2_vs_time.png'),
    ('u3', '4-Velocity (u3)', '4-Velocity u3 vs Time', 'u3_vs_time.png'),
    ('Speed', 'Speed', 'Speed vs Time', 'speed_vs_time.png'),
    ('Momentum1', '4-Momentum (Momentum1)', '4-Momentum Momentum1 vs Time', 'momentum1_vs_time.png'),
    ('Momentum2', '4-Momentum (Momentum2)', '4-Momentum Momentum2 vs Time', 'momentum2_vs_time.png'),
    ('Momentum3', '4-Momentum (Momentum3)', '4-Momentum Momentum3 vs Time', 'momentum3_vs_time.png'),
    ('Scalar_Momentum', 'Scalar Momentum', 'Scalar Momentum vs Time', 'scalar_momentum_vs_time.png'),
    ('Energy', 'Energy', 'Energy vs Time', 'energy_vs_time.png')
]

# Plot each variable against time
for var, ylabel, title, save_as in variables:
    plot_variable(data, 'Time', var, ylabel, title, save_as)

print("Plots have been saved as PNG files.")